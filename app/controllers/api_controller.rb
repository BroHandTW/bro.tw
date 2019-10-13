# frozen_string_literal: true

#:
class ApiController < ApplicationController
  # before_action :authenticate_user!, :authenticate_admin!

  def hello
    render plain: "#{request.method} => #{request.params}"
  end
end
