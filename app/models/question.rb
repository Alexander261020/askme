class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  validates :text, presence: true
  validates :text, length: { maximum: 255 }
end
