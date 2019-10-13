# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    description 'The query root of this schema'

    field :admin, AdminType, null: true do
      description 'Find a admin by ID'
      argument :id, ID, required: true
    end

    field :user, UserType, null: true do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    def admin(id:)
      Admin.find_by(id: id)
    end

    def user(id:)
      User.find_by(id: id)
    end
  end
end
