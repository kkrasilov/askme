class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions

  validates :text, presence: true, length: {maximum: 255}

  after_commit :update_hashtags, on: %i[create update]

  private

  def update_hashtags
    hashtag_questions.clear
    "#{text} #{answer}".downcase.scan(Hashtag::HASHTAG_REGEX).uniq.each do |hashtag|
      hashtags << Hashtag.find_or_create_by(name: hashtag.delete('#'))
    end
  end
end
