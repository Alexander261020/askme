class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:create, :tag]

  def create
    @question = Question.new(question_params)
    @question.author = current_user

    if @question.save
      tags = hashtags_question(question_params)
      set_tags(tags)

      # После сохранения вопроса редиректим на пользователя
      redirect_to user_path(@question.user), notice: 'Вопрос задан'
    else
      render :edit
    end
  end

  def update
    # получаем теги при ответе на вопрос
    # @question[:tags] = hashtags_question(question_params)

    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос был сохранен'
    else
      render :edit
    end
  end

  def destroy
    user = @question.user
    @question.destroy
    redirect_to user_path(@question.user), notice: 'Вопрос удален :('
  end

  private

  def set_tags(tags)
    tags.each do |tag|
      unless Tag.exists?(hashtag: tag)
        @tag = Tag.create(hashtag: tag)
      else
        @tag = Tag.where(hashtag: tag)
      end

      unless QuestionsTag.exists?(tag: @tag, question: @question)
        # @question.tags.
        @question.questions_tags.create(tag: @tag)
        # QuestionsTag.create(tag: @tag, question: @question)
      end
    end
  end

  # метод нужен для получения и удаления хештегов при создании/редактировании вопросов и ответов
  def hashtags_question(question_params)
    heshtags = []
    heshtags += search_tags(question_params[:text]) if question_params[:text]
    heshtags += search_tags(question_params[:answer]) if question_params[:answer]
    heshtags.uniq
  end

  def search_tags(string)
    string.downcase.scan(/#[а-яa-z\w\-]+/i)
  end 


  def load_question
    @question = Question.find(params[:id])
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def question_params
    if current_user.present? && params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end
end
