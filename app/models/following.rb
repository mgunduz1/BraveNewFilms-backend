class Following < ApplicationRecord
    belongs_to :user
    belongs_to :followable, polymorphic: true
    validates_presence_of :user_id, :followable_id, :followable_type
    validates :user_id, uniqueness: { scope: [:followable_id, :followable_type] }
end