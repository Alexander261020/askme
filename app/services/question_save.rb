class QuestionSave < ApplicationController
  def self.call(params, current_user, captcha)
    new_hastags = Hashtag.search_hashtags(params[:text])

    params[:text].delete!('#')

    question = Question.new(params)
    question.author = current_user

    # Проверяем капчу вместе с сохранением вопроса. Если в капче ошибка,
    # она будет добавлена в массив @question.errors
    question.tags = Hashtag.set(new_hastags) if captcha && question.save

    question
  end
end
