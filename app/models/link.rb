# frozen_string_literal: true

# :
class Link < ApplicationRecord
  belongs_to :user, counter_cache: true, optional: true
  belongs_to :visitor, counter_cache: true, optional: true

  def url=(str)
    self[:md5] = LinkService.md5 str
    self[:slug] = LinkService.key
    super
  end
end
