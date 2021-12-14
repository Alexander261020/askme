class Tag < ApplicationRecord
  has_many :QuestionTag
  has_many :questions, through: :QuestionTag

  validates :hashtag, presence: true
  validates :hashtag, length: { maximum: 128 }
end
