class HashtagSet
  def self.call(array_hastags)
    array_hastags.map { |hashtag| Tag.find_or_create_by(hashtag: hashtag) }
  end

  def self.search(string)
    string.downcase.scan(Tag::REGEXP_TAGS).uniq.map { |tag| tag.delete('#') }
  end
end
