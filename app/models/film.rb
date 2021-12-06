class Film < ApplicationRecord
    belongs_to :genre
    has_many :followings, as: :followable, dependent: :destroy
    has_many :characters
end