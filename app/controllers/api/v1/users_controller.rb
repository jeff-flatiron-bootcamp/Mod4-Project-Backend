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

    def user_high_scores
      temp = @user.user_games
      easy = temp.select{|record| record.game.difficulty == "Easy" && record.score !=nil}.max_by{|item| item['score']}    
      medium = temp.select{|record| record.game.difficulty == "Medium"  && record.score !=nil}.max_by{|item| item['score']}
      hard = temp.select{|record| record.game.difficulty == "Hard"  && record.score !=nil}.max_by{|item| item['score']}
      high_scores = {easy: easy, medium: medium, hard: hard}
        
      render json: { high_scores: high_scores}, status: :accepted
    end
   
    def high_scores  
      temp = UserGames.all
      easy_5 = temp.select{|record| record.game.difficulty == "Easy" && record.score !=nil}.sort_by{|item| -item['score']}.take(5)  
      easy_5 = easy_5.map{|item| ret = { user_game: item, user: {username: item.user.username }}}      
      medium_5 = temp.select{|record| record.game.difficulty == "Medium"  && record.score !=nil}.sort_by{|item| -item['score']}.take(5)
      medium_5 = medium_5.map{|item| ret = { user_game: item, user: {username: item.user.username }}}
      hard_5 = temp.select{|record| record.game.difficulty == "Hard"  && record.score !=nil}.sort_by{|item| -item['score']}.take(5)
      hard_5 = hard_5.map{|item| ret = { user_game: item, user: {username: item.user.username }}}
      high_scores = {easy_5: easy_5, medium_5: medium_5, hard_5: hard_5}
        
      render json: { high_scores: high_scores}, status: :accepted
    end    

    def newgame        
        foundGame = Game.find_by(difficulty: params["user"]["game_type"])
        user_game = UserGames.create(user_id: @user.id, game_id: foundGame.id)        
        tiles = Tile.where(game_id: foundGame.id)
        render json: { created_UserGame: user_game, tiles: tiles}, status: :accepted
    end

    def updategame
      foundUserGame =  UserGames.find(params["user"]["user_game"]["id"])
      foundUserGame.update(score: params["user"]["user_game"]["score"], time: params["user"]["user_game"]["time"])
      render json: { updated_UserGame: foundUserGame}, status: :accepted
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