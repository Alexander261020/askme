class QuestionSave < ApplicationController
  def self.call(params, current_user, captcha)
    @current_user = current_user
    @question = Question.new(params)
    @question.author = current_user

    # Проверяем капчу вместе с сохранением вопроса. Если в капче ошибка,
    # она будет добавлена в массив @question.errors.
    # if check_captcha(@question) && @question.save
    if (current_user.present? || captcha) && @question.save
      Hashtag.set_tags(@question)
    end

    @question
  end
end
