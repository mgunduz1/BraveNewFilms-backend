module Types
  class FollowingType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :followable_id, ID, null: false
    field :followable_type, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
