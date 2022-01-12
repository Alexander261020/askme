class QuestionUpdate
  def self.call(question, params)
    question.tags = HashtagSet.("#{question.text} #{question.answer}") if question.update(params)

    question
  end
end
