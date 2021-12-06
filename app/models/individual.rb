class Individual < ApplicationRecord
    has_many :followings, as: :followable, dependent: :destroy
    has_many :characters
end