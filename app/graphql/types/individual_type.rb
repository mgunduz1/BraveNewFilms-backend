module Types
  class IndividualType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :films, [Types::FilmType], null: true
    field :followers, [Types::FollowingType], null: false

    def films
      object.characters.map(&:film)
    end

    def followers
      object.followings
    end

  end
end
