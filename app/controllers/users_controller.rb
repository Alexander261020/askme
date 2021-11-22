class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
  end

  def show

    @user = User.new(
      name: 'Vadim',
      username: 'installero',
      avatar_url: 'https://secure.gravatar.com/avatar/71269686e0f757ddb4f73614f43ae445?s=100'
    )

    @new_question = Question.new

    @questions = Question.all
    @amount_questions = Question.all.count
    @amount_answers = Question.where.not(:answer => nil).count
    @questions_without_answer = Question.where(:answer => nil).count
  end

  private

  def user_params
    # берём объект params, потребуем у него иметь ключ
    # :user, у него с помощью метода permit разрешаем
    # набор инпутов. Ничего лишнего, кроме них, в пользователя не попадёт
    params.require(:user).permit(:email, :password, :password_confirmation,
                                    :name, :username, :avatar_url)
  end
end
