# frozen_string_literal: true

# :
class LinkService
  class << self
    def get_by_url(url)
      link = Link.find_by(md5: md5(url)) || Link.create(url: url)
      link.slug
    end

    def get_by_slug(slug)
      Link.find_by(slug: slug)&.url
    end

    def md5(str)
      Digest::MD5.hexdigest str.to_s
    end

    def key(size = 5)
      # x(5).size = 7, x(4).size = 6, x(3).size = 4
      SecureRandom.urlsafe_base64(size)
    end
  end
end
