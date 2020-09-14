class HashtagsController < ApplicationController
  before_action :load_hashtag

  def show
    @questions = @hashtag.questions
  end

  private

  def load_hashtag
    @hashtag = Hashtag.find_by!(name: params[:name])
  end
end
