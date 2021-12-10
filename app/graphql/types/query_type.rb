module Types
  class QueryType < Types::BaseObject


    field :films, [Types::FilmType], null: false

    def films
      Film.all
    end
    

    field :genres, [Types::GenreType], null: false

    def genres
      Genre.all
    end

    field :individuals, [Types::IndividualType], null: false

    def individuals
      Individual.all
    end

    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :film, Types::FilmType, null: false do
      argument :id, ID, required: true
    end

    def film(id:)
      Film.find(id)
      
    end

  end
end
