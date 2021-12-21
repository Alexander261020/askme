module Hashtag
  def self.set_tags(question)
    # проходимся по массиву в поисках хаштегов
    question_to_words(question).each do |hashtag|
      tag = Tag.find_or_create_by(hashtag: hashtag)
      QuestionTag.find_or_create_by(question: question, tag: tag)
    end
  end

  # создаем массив слов из строк вопроса и ответа
  def self.question_to_words(question)
    "#{question[:text]} #{question[:answer]}".downcase.split.uniq
  end
end
