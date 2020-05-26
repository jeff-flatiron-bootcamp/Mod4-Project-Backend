class UserGames < ApplicationRecord    
    belongs_to :user
    belongs_to :game   
    attr_accessor :ret_user 
end
