module Hashtag
  def self.set_tags(hashtags, question)
    hashtags.each do |hashtag|
      tag = Tag.find_or_create_by(hashtag: hashtag)
      QuestionTag.find_or_create_by(question: question, tag: tag)
    end
  end

  def self.hashtags_question(question_params)
    heshtags = []
    heshtags += search_tags(question_params[:text]) if question_params[:text]
    heshtags += search_tags(question_params[:answer]) if question_params[:answer]
    heshtags.uniq
  end

  private

  def self.search_tags(string)
    string.downcase.scan(/#[а-яa-z\w\-]+/i)
  end
end
