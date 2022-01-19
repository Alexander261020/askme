class HashtagSet
  def self.call(string)
    string.downcase.scan(Tag::REGEXP_TAGS).uniq.map do |hashtag|
      Tag.create_or_find_by(text: hashtag.delete('#'))
    end
  end
end
