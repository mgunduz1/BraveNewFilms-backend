module Types
  class MutationType < Types::BaseObject
    field :create_following, mutation: Mutations::CreateFollowing
    field :destroy_following, mutation: Mutations::DestroyFollowing
  end
end
