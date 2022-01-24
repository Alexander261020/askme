module ApplicationHelper
  def tags_string(tags)
    tags.map do |tag|
      link_to tag[:text], tag_path(tag[:text])
    end.join(" | ")
  end

  # Этот метод возвращает ссылку на аватарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку
  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar2.jpg')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
 
  def get_declination(amount, form_word1, form_word2, form_word3)
    result = amount % 10 unless (11..14).include?(amount % 100)

    def_form_word = 
      case result
      when 1 then form_word1
      when 2..4 then form_word2
      else form_word3
      end
    "#{amount} #{def_form_word}"
  end
end
