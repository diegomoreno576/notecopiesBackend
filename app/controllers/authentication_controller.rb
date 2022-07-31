class AuthenticationController < ApplicationController
    skip_before_action :authentication_request
    #POST /auth/login
    def login
       @user = User.find_by_email(params[:email])
       if @user&.authenticate(params[:password])
          token = jwt_encode(user_id: @user.id)
          render json: { jwt: token }, status: :ok
       else
          render json: { error: 'Unauthorized' }, status: :unauthorized
       end
    end
 end