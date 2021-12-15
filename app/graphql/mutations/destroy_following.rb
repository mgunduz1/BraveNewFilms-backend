module Mutations
    class DestroyFollowing < BaseMutation
      null false
      argument :user_id, ID, required: true
      argument :followable_id, ID, required: true
      argument :followable_type, String, required: true
  
      type Types::FollowingType
  
      def resolve(user_id: nil, followable_id: nil, followable_type: nil)
        following = Following.find_by(
            user_id: user_id,
            followable_id: followable_id,
            followable_type: followable_type,
        )
        following.destroy
      end
    end
  end