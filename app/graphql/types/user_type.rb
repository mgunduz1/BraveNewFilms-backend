module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :followed_genres, [Types::GenreType], null: false
    field :followed_films, [Types::FilmType], null: false
    field :followed_individuals, [Types::IndividualType], null: false

    def followed_genres
      Genre.where(id: object.followings.where(followable_type: "Genre").pluck(:followable_id))
    end

    def followed_films
      Film.where(id: object.followings.where(followable_type: "Film").pluck(:followable_id))
    end

    def followed_individuals
      Individual.where(id: object.followings.where(followable_type: "Individual").pluck(:followable_id))
    end

  end
end
