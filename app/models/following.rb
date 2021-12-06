class Following < ApplicationRecord
    belongs_to :user
    belongs_to :followable, polymorphic: true
end