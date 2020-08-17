module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def question_declension
    I18n.translate :question, :count => @questions_count
  end

  def answer_declension
    I18n.translate :answer, :count => @answers_count
  end

  def unanswered_declension
    I18n.translate :unanswered, :count => @unanswered_count
  end
end
