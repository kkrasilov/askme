module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
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
