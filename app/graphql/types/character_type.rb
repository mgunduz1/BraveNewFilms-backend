module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :film_id, Integer, null: true
    field :individual_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :real_name, Types::IndividualType, null: true

    def real_name
      object.individual
    end


  end
end
