class Hashtag < ApplicationController
  def self.set(array_hastags)
    array_hastags.map { |hashtag| Tag.find_or_create_by(hashtag: hashtag.delete('#')) }
  end

  def self.search_hashtags(string)
    string.downcase.scan(Tag::REGEXP_TAGS).uniq
  end
end
