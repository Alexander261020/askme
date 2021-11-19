class UsersController < ApplicationController
  def index
    # Создаём массив из двух болванок пользователей. Вызываем метод # User.new, который создает модель, 
    # не записывая её в базу.
    # У каждого юзера мы прописали id, чтобы сымитировать реальную
    # ситуацию – иначе не будет работать хелпер путей
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun'),
      User.new(id: 3, name: 'Sergey', username: 'Serg'),
      User.new(id: 4, name: 'Artem', username: 'Tema', avatar_url: 'avatar2.jpg')
    ]
  end

  def new
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
      Question.new(id: 1, text: 'Как дела?', created_at: Date.parse('27.03.2016'), answer: 'I am fine!'),
      Question.new(id: 2, text: 'It is number 2', created_at: Date.parse('27.03.2016'), answer: 'Answer 2'),
      Question.new(id: 3, text: 'It is number 3', created_at: Date.parse('27.03.2016'), answer: 'Answer 3'),
      Question.new(id: 4, text: 'It is number 4', created_at: Date.parse('27.03.2016'), answer: 'Answer 4'),
      Question.new(id: 5, text: 'It is number 5', created_at: Date.parse('27.03.2016'), answer: 'Answer 5'),
      Question.new(id: 6, text: 'It is number 6', created_at: Date.parse('27.03.2016'))
    ]

    @new_question = Question.new

    @up_text = "У #{@user.name}а есть #{helpers.get_declination(@questions.count, 'вопрос', 'вопроса', 'вопросов')}, "\
      "#{helpers.get_declination(@questions.map(&:answer).compact.count, 'ответ', 'ответа', 'ответов')} "\
      "и #{helpers.get_declination(@questions.map(&:answer).count(nil), 'вопрос', 'вопроса', 'вопросов')} без ответа."
  end
end
