class UsersController < ApplicationController
    def show
        user= User.find(params[:id])
        render json: user, each_serializer: UserSerializer
    end

    def index 
      users = User.all
      render json: users, each_serializer: UserSerializer, include: "**"
    end
 
    def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: user.id, token: generate_token({id: user.id})}, include: "**"
        else
            render json: {message: "did not logged_in"}
        end
    end
   
    def update
      user= User.find_by(id: params[:id])
      user = User.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], username: params[:user][:username], email: params[:user][:email])
      render json: user
    end

    def create
      @user = User.create(user_params)
      render json: @user
    end

    def validate
      id = decode_token
      user = User.find_by(id: id)
      if user
        # render json: {user: user, token: generate_token({ id: user.id}), pets: PetSerializer.new(pets), followings: followings}
        render json: {user: user.id, token: generate_token({id: user.id})}
      else
        render json: {message: "did not logged_in"}
      end
    end

    def search_users
      users = User.all
      render json: users, each_serializer: SearchUserSerializer
    end
    private 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end
