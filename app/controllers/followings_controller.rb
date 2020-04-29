class FollowingsController < ApplicationController
    def create 
        following = Following.create(following_params)
        render json: following.pet
    end

    def destroy
        follow = Following.find_by(id: params[:id])
        follow.destroy
        render json: follow.pet
    end
    
    def index 
        followings = Following.all
        render json: followings, each_serializer: FollowingSerializer, include: "**"
    end

    def petsFollowers
        pet = Pet.find_by(id: params[:id])
        render json: pet.followings, each_serializer: PetFollowerSerializer
    end

    def userFollowing
        user = User.find_by(id: params[:id])
        render json: user.followings, each_serializer: UserFollowingSerializer
    end
    private

    def following_params
        params.require(:following).permit(:pet_id, :user_id)
    end
end