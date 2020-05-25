class User < ApplicationRecord
    has_secure_password
    has_many :user_games, class_name: 'UserGames'
    has_many :games, through: :user_games
    validates :username, uniqueness: { case_sensitive: false }

    #Class method to be used when seeding users
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end
end
