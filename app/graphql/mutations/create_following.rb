module Mutations
    class CreateFollowing < BaseMutation
      null false
      argument :user_id, ID, required: true
      argument :followable_id, ID, required: true
      argument :followable_type, String, required: true
  
      type Types::FollowingType
  
      def resolve(user_id: nil, followable_id: nil, followable_type: nil)
        Following.create!(
            user_id: user_id,
            followable_id: followable_id,
            followable_type: followable_type,
        )
      end
    end
  end