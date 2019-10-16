# frozen_string_literal: true

# :
class LinksController < ApplicationController
  def decode
    @url = LinkService.get_by_slug params[:slug]
    return head :not_found unless @url

    render layout: 'link'
  end
end
