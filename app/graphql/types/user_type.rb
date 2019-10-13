# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, Integer, null: true
    field :account, String, null: true
  end
end
