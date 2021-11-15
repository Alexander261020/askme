class Question < ApplicationRecord

  belongs_to :user

  validates :user, :text, presence: true
  validates :text, length: {minimum: 1, maximum: 255}
end
