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

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :film, Types::FilmType, null: false do
      argument :id, ID, required: true
    end

    def film(id:)
      Film.find(id)
      
    end

    field :genre, Types::GenreType, null: false do
      argument :id, ID, required: true
    end

    def genre(id:)
      Genre.find(id)
    end

    field :individual, Types::IndividualType, null: false do
      argument :id, ID, required: true
    end

    def individual(id:)
      Individual.find(id)
    end

    field :recommended, [Types::FilmType], null: false do
      argument :id, ID, required: true
    end

    def recommended(id:)
      Film.where(id: User.recommendation(id))
    end


  end
end
