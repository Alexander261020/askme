class HashtagSet
  def self.call(string)
    string.downcase.scan(Tag::REGEXP_TAGS).uniq.map do |hashtag|
      Tag.find_or_create_by(text: hashtag.delete('#'))
    end
  end
end
