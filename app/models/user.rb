class User < ApplicationRecord
  require 'openssl'

  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  validates :email, :username, presence: true, uniqueness: true
  validates :username, format: { with: /\w+/ }
  validates :username, length: { maximum: 40 }
  validates :email, format: { with: /\w+@[a-z]+\.[a-z]+/ }
  # валидация будет проходить только при создании нового юзера
  validates :password, presence: true, on: :create
  # и поле подтверждения пароля
  validates :password, confirmation: true

  has_many :questions

  before_validation :username_downcase, :email_downcase
  before_save :encrypt_password

  # Основной метод для аутентификации юзера (логина). Проверяет email и пароль,
  # если пользователь с такой комбинацией есть в базе, возвращает этого
  # пользователя. Если нет — возвращает nil.
  def self.authenticate(email, password)
    email.downcase!
    # Сперва находим кандидата по email
    user = find_by(email: email)

    # Если пользователь не найден, возвращает nil
    return unless user.present?

    # Формируем хэш пароля из того, что передали в метод
    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    # Обратите внимание: сравнивается password_hash, а оригинальный пароль так
    # никогда и не сохраняется нигде. Если пароли совпали, возвращаем
    # пользователя.
    return user if user.password_hash == hashed_password
  end

  # Служебный метод, преобразующий бинарную строку в шестнадцатиричный формат,
  # для удобства хранения.
  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  private

  def encrypt_password
    if password.present?
      # Создаем т.н. «соль» — случайная строка, усложняющая задачу хакерам по
      # взлому пароля, даже если у них окажется наша БД.
      #У каждого юзера своя «соль», это значит, что если подобрать перебором пароль
      # одного юзера, нельзя разгадать, по какому принципу
      # зашифрованы пароли остальных пользователей
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      # Создаем хэш пароля — длинная уникальная строка, из которой невозможно
      # восстановить исходный пароль. Однако, если правильный пароль у нас есть,
      # мы легко можем получить такую же строку и сравнить её с той, что в базе.
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def username_downcase
    username&.downcase!
  end

  def email_downcase
    email&.downcase!
  end
end
