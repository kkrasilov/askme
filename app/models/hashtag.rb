class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /#[[:alpha:]-]+/.freeze

  has_many :hashtag_questions
  has_many :questions, through: :hashtag_questions

  scope :with_questions, -> { joins(:questions).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true

  def to_param
    name
  end
end
