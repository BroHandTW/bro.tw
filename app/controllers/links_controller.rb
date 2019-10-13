# frozen_string_literal: true

# :
class LinksController < ApplicationController
  def encode
    return render plain: 'no params' unless params[:url]
    @slug = LinkService.get_by_url params[:url]

    render layout: 'link'
  end

  def decode
    @url = LinkService.get_by_slug params[:slug]

    render layout: 'link'
  end
end
