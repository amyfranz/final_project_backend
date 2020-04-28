class LikesController < ApplicationController
    def create 
    like = Like.create(like_params)
        if like.valid?
            render json: like, each_serializer: LikeSerializer, include: "**"
        else
            render json: {message: "did not create a new comment"}
        end
    end

    def index 
        likes = Like.all
        render json: likes
    end

    def destroy
        like = Like.find_by(id: params[:id])
        like.destroy
    end

    private

    def like_params
        params.require(:like).permit(:post_id, :user_id, :created_at)
    end
end