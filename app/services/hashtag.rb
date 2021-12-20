module Hashtag
  def self.set_tags(hashtags, question)
    hashtags.each do |hashtag|
      tag = Tag.find_or_create_by(hashtag: hashtag)
      QuestionTag.find_or_create_by(question: question, tag: tag)
    end
  end

  def self.tags_question(question)
    (search_tags(question[:text]) + search_tags(question[:answer])).uniq
  end

  private

  def self.search_tags(string)
    normalize_string(string.to_s.downcase).split
  end

  # преобразовываем "ё" -> "е", "й" -> "и"
  def self.normalize_string(string)
    string.chars.map do |letter|
      case letter
      when "ё" then "е"
      when "й" then "и"
      else letter
      end
    end.join
  end
end
