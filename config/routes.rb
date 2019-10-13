# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope path: 'api/v1' do
    match 'hello', to: 'application#hello', via: :all
  end
  devise_for :admins
  devise_for :users
  root 'application#index'
  get '*path', to: 'application#index'
end
