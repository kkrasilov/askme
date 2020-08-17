class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Константин',
        username: 'kkrasilov',
        avatar_url: 'https://goodprogrammer.ru/system/avatars/000/015/986/0ecd71ec7c829b856d79bd086bb9e4eaf51d88c7_x300.jpg?1590828831'
      ),
      User.new(
        id: 2,
        name: 'Александр',
        username: 'alex',
        avatar_url: ''
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Константин',
      username: 'kkrasilov',
      avatar_url: 'https://goodprogrammer.ru/system/avatars/000/015/986/0ecd71ec7c829b856d79bd086bb9e4eaf51d88c7_x300.jpg?1590828831'
    )
    @questions = [
      Question.new(text: 'Как дела?', answer: 'хорошо!', created_at: Date.parse('15.08.2020')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('15.08.2020'))
    ]

    @questions_count = @questions.count
    @answers_count = @questions.filter_map(&:answer).count
    @unanswered_count = @questions_count - @answers_count

    @new_question = Question.new
  end
end
