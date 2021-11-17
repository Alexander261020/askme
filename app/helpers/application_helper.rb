module ApplicationHelper
  # Этот метод возвращает ссылку на аватарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которую положим в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def amount_questions(amount)
  result = amount % 10 unless (11..19).include?(amount % 100)

  def_form_word =
    case result
    when 1 then 'вопрос'
    when 2..4 then 'вопроса'
    else 'вопросов'
    end
    "#{amount} #{def_form_word}"
  end 
end
