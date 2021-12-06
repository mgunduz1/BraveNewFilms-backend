class Genre < ApplicationRecord
    has_many :films
    has_many :followings, as: :followable, dependent: :destroy
end