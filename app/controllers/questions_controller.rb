class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:create, :tag]

  def create
    @question = QuestionSave.(question_params, current_user, check_captcha)

    if @question.persisted?
      redirect_to user_path(@question.user), notice: 'Вопрос задан'
    else
      render :edit
    end
  end

  def update
    question = QuestionUpdate.(@question, question_params)

    if question.persisted?
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
      params.require(:question).permit(:user_id, :text, :answer)
    end
  end
end
