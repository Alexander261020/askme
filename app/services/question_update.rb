class QuestionUpdate
  def self.call(question, params)
    new_hastags = HashtagSet.search("#{params[:text]} #{params[:answer]}")

    params[:text].delete!('#')
    params[:answer]&.delete!('#')

    if question.update(params)
      # добавляем новые хештеги к уже существующим хештегам вопроса, удаляем отсутствующие хештеги
      hashtags = (new_hastags + question.tags.map(&:hashtag)).uniq & "#{question.text} #{question.answer}".split
      # записываем оставшиеся хештеги
      question.tags = HashtagSet.(hashtags)
    end

    question
  end
end
