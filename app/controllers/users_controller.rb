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
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016'), answer: 'I am fine!'),
      Question.new(text: 'It is number 2', created_at: Date.parse('27.03.2016'), answer: 'Answer 2'),
      Question.new(text: 'It is number 3', created_at: Date.parse('27.03.2016'), answer: 'Answer 3'),
      Question.new(text: 'It is number 4', created_at: Date.parse('27.03.2016'), answer: 'Answer 4'),
      Question.new(text: 'It is number 5', created_at: Date.parse('27.03.2016'), answer: 'Answer 5'),
      Question.new(text: 'It is number 6', created_at: Date.parse('27.03.2016'))
    ]
    @new_question = Question.new

    @up_block = "У #{@user.name} а есть #{helpers.get_declination(@questions.count, 'вопрос', 'вопроса', 'вопросов')},"
=begin     <%= get_declination(@questions.map(&:answer).compact.count, 'ответ', 'ответа', 'ответов') %>,
    и <%= get_declination(@questions.map(&:answer).count(nil), 'вопрос', 'вопроса', 'вопросов') %> без ответа." 
=end

  end

  private

  def user_params
    # берём объект params, потребуем у него иметь ключ
    # :user, у него с помощью метода permit разрешаем
    # набор инпутов. Ничего лишнего, кроме них, в пользователя не попадёт
=begin     params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url) 
=end
  end
end
