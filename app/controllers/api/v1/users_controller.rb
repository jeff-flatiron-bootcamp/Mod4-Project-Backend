class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
   
    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def games
        games = Game.all        
        render json: { game_types: games}, status: :accepted
    end

    def user_games
        user_games = @user.user_games        
        render json: { user_games: user_games}, status: :accepted
    end
   
    def high_scores
      #query user_games for top scores per game type
      #scores per user 
      #times
    end    

    def newgame        
        foundGame =  Game.all[0]#Game.find(params["user"]["game_type"])
        game = UserGames.create(user_id: @user.id, game_id: foundGame.id)        
        tiles = Tile.where(game_id: foundGame.id)
        render json: { created_game: game, tiles: tiles}, status: :accepted
    end

    def updategame
      #patch to user game
    end

    def create        
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end   
   
    private
    def user_params
      params.require(:user).permit(:username, :password, :country, :avatar)
    end
  end