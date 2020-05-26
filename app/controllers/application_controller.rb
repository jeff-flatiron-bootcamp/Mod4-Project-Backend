class ApplicationController < ActionController::API
    before_action :authorized
    skip_before_action :authorized, only: [:check_user]
   
    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'memory_game')
    end
   
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
   
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'memory_game', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
   
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end

    def check_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    end
   
    def logged_in?
      !!current_user
    end
   
    def authorized        
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  end