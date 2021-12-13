class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :questions_tags
  has_many :tags, through: :questions_tags

  validates :text, presence: true
  validates :text, length: { maximum: 255 }
end
