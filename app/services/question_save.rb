class QuestionSave < ApplicationController
  def self.call(params, current_user, captcha)
    @current_user = current_user
    @question = Question.new(params)
    @question.author = current_user

    # Проверяем капчу вместе с сохранением вопроса. Если в капче ошибка,
    # она будет добавлена в массив @question.errors.
    if captcha && @question.save
      @question.tags =
      "#{@question.text} #{@question.answer}".
        downcase.
        scan(Tag::REGEXP_TAGS).
        uniq.
        map { |hashtag| Tag.find_or_create_by(hashtag: hashtag.delete('#')) }
    end

    @question
  end
end
