# frozen_string_literal: true

#:
class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, :authenticate_admin!

  def index
    render html: nil, layout: true
  end

  def unauthorized
    head :unauthorized
  end

  def hello
    render plain: "#{request.method} => #{request.params}"
  end
end
