class QuestionSave
  def self.call(params, current_user, captcha)
    question = Question.new(params)
    question.author = current_user

    # Проверяем капчу вместе с сохранением вопроса. Если в капче ошибка,
    # она будет добавлена в массив @question.errors
    question.tags = HashtagSet.(question.text) if captcha && question.save

    question
  end
end
