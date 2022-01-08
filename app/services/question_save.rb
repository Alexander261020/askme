class QuestionSave
  def self.call(params, current_user, captcha)
    new_hastags = HashtagSet.search(params[:text])

    params[:text].delete!('#')

    question = Question.new(params)
    question.author = current_user

    # Проверяем капчу вместе с сохранением вопроса. Если в капче ошибка,
    # она будет добавлена в массив @question.errors
    question.tags = HashtagSet.(new_hastags) if captcha && question.save

    question
  end
end
