class Tag < ApplicationRecord
  has_many :questions_tags
  has_many :questions, through: :questions_tags

  validates :hashtag, presence: true
  validates :hashtag, length: { maximum: 128 }
end
