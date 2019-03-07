class Game < ApplicationRecord
    has_many :characters, dependent: :destroy
end
