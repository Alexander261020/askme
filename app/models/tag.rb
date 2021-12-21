class Tag < ApplicationRecord
  REGEXP_TAGS = /#[[:word:]-]+/

  has_many :question_tags
  has_many :questions, through: :question_tags

  validates :hashtag, presence: true
  validates :hashtag, length: { maximum: 128 }
  validates :hashtag, format: { with: REGEXP_TAGS }
end
