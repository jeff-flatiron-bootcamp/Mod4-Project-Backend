class Game < ApplicationRecord
    has_many :user_games, class_name: 'UserGames'
    has_many :users, through: :user_games
    has_many :tiles
end
