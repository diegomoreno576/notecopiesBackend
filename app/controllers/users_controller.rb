class UsersController < ApplicationController
    skip_before_action :authentication_request, only: [:create]
    before_action :set_user, only: [:show, :destroy]
 # GET /users
    def index
       @users = User.all
       render json: @users, status: :ok
    end
 # GET /users/:id
    def show
       render json: @user, status: :ok
    end
    #GET user
    def show_user 
      @blogs = Blog.all
        render json:{
         user: @current_user_id,
         blog: @blogs
        }, status: :ok
    end
    # POST /users
    def create
       @user = User.new(user_params)
       if @user.save
          render json: @user, status: :created
       else
          render json: @user.errors, status: :unprocessable_entity
       end
    end
    # DELETE /users/:id
    def destroy
       @user.destroy
    end
    private
    def user_params
       params.permit(:username, :email, :password)
    end
 
    def set_user
       @user = User.find(params[:id])
    end
 end