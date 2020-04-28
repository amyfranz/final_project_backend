class PostsController < ApplicationController

    def create 
        post = Post.create(post_params) 
    end

    def index 
        posts = Post.all
        render json: posts
    end 


    def show 
        posts = Post.find_by(id: params[:id])
        render json: posts, each_serializer: PostSerializer, include: "**.*"
    end 

    private

    def post_params
        params.require(:post).permit(:bio, :user_id, :pet_id, :posted)
    end
end