# frozen_string_literal: true

# BrobaoSchema.execute(...)
class BrobaoSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
