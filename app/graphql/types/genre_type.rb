module Types
  class GenreType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :films, [Types::FilmType], null: false
    field :landing_films, [Types::FilmType], null: false
    field :followers, [Types::FollowingType], null: false

    def films
      object.films
    end

    def landing_films
      object.films.first(4)
    end

    def followers
      object.followings
    end

  end
end
