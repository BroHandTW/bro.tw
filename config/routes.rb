# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    get 'encode', to: 'links#encode'
    match :hello, via: :all
    devise_for :admins
    devise_for :users
    match '*_', to: proc { [404, {}, ['']] }, via: :all
  end

  get '/:slug', to: 'links#decode', as: :decode
  root 'application#index'
  match '*_', to: proc { [404, {}, ['']] }, via: :all
  # get '*path', to: 'application#index'
end
