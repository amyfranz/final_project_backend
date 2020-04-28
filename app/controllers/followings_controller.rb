class FollowingsController < ApplicationController
    def create 
        following = Following.create(following_params) 
        render json: following
    end

    def destroy
        follow = Following.find_by(id: params[:id])
        follow.destroy
    end
    
    def index 
        followings = Following.all
        render json: followings, each_serializer: FollowingSerializer, include: "**"
    end 
    private

    def following_params
        params.require(:following).permit(:pet_id, :user_id)
    end
end