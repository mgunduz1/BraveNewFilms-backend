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
    field :characters, [Types::CharacterType], null: true

    def characters
      object.characters
    end
  end
end
