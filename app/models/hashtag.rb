class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /#[\wa-яё]+/.freeze

  has_many :hashtag_questions
  has_many :questions, through: :hashtag_questions

  before_validation { name&.downcase! }

  validates :name, presence: true
end
