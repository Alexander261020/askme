class QuestionUpdate < ApplicationController
  def self.call(question, params)
    new_hastags = Hashtag.search_hashtags("#{params[:text]} #{params[:answer]}")

    params[:text].delete!('#')
    params[:answer]&.delete!('#')

    if question.update(params)
      # сверяем текст массива с его хештегами, удаляем отсутствующие хештеги, складываем новые хештеги
      hashtags = new_hastags + ["#{question.text} #{question.answer}".split & question.tags.map(&:hashtag)].flatten!

      question.tags = Hashtag.set(hashtags)
    end

    question
  end
end
