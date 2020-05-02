class PostsController < ApplicationController

    def create 
        post = Post.new(post_params) 
        post.posted = Time.now
        post.save
        render json: post.pet, each_serializer: PetSerializer
    end

    def index 
        posts = Post.all
        render json: posts, each_serializer: PostSerializer
    end 

    def show 
        posts = Post.find_by(id: params[:id])
        render json: posts.to_json(only: [:id, :image, :bio],
            include: [comments: { only: [:id, :comment], include: [user:{only: [:username]}]}, likes:{only: [:id, :user_id]}])
    end 

    private

    def post_params
        params.require(:post).permit(:bio, :pet_id, :posted, :image)
    end
end