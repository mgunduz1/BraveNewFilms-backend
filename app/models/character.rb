class Character < ApplicationRecord
    belongs_to :film
    belongs_to :individual
end