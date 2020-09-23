class QuestionsController < ApplicationController
  before_action :load_question, only: %i[edit update destroy]
  before_action :authorize_user, except: %i[create]
  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.author = @current_user
    
    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user), notice: I18n.t('controllers.questions.asked')
    else
      render :edit
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: I18n.t('controllers.questions.saved')
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user), notice: I18n.t('controllers.questions.destroyed')
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def question_params
    if current_user.present? &&
      params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end
end
