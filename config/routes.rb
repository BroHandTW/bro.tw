# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    match :hello, via: :all
    match '*_', to: ->(_) { [404, {}, ['']] }, via: :all
  end

  get 'encode', to: 'links#encode'
  get 'decode/:slug', to: 'links#decode', as: :decode

  devise_for :admins
  devise_for :users
  root 'application#index'
  get '*path', to: 'application#index'
end
