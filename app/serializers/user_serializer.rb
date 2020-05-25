class UserSerializer < ActiveModel::Serializer
    attributes :username, :country, :avatar, :user_games    
  end