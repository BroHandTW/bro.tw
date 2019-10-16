# frozen_string_literal: true

# :
class Api::LinksController < ApplicationController
  def encode
    return head :not_found unless params[:url]

    @slug = LinkService.get_by_url params[:url]

    render plain: base_url(@slug)
  end

  private

  def base_url(slug)
    "http://lvh.me:3000/#{slug}"
    # decode_url(slug) will url_decode !!
  end
end
