class Tag < ApplicationRecord
  REGEXP_TAGS = /#[[:word:]-]+/

  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags

  validates :text, presence: true
  validates :text, length: { maximum: 128 }

  scope :load_questions, -> { joins(:questions).distinct }
end
