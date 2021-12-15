module Types
  class FilmType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :year, Integer, null: true
    field :genre_id, Integer, null: true
    field :cast, String, null: true
    field :poster, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :individuals, [Types::IndividualType], null: true
    field :followers, [Types::FollowingType], null: true
    field :recommended, [Types::FilmType], null: true do
      argument :id, ID, required: true
    end

    def individuals
      object.characters.map(&:individual)
    end

    def followers
      object.followings
    end

    def recommended(id:)
      Film.where(id: User.recommendation(id))
    end

  end
end
