class PostsController < ApplicationController

    def create 
        post = Post.create(post_params) 
        render json: post, each_serializer: PostSerializer
    end

    def index 
        posts = Post.all
        render json: posts, each_serializer: PostSerializer
    end 


    def show 
        posts = Post.find_by(id: params[:id])
        render json: posts, each_serializer: PostSerializer
    end 

    private

    def post_params
        params.require(:post).permit(:bio, :pet_id, :posted, :image)
    end
end