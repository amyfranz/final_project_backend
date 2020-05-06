class PostsController < ApplicationController

    def create 
        post = Post.new(post_params) 
        if post.valid?
            post.posted = Time.now
            post.save
            render json: {pet: PetSerializer.new(post.pet)}
        else
            render json: {messages: post.errors.full_messages}
        end
    end

    def index 
        posts = Post.all
        render json: posts, each_serializer: PostSerializer
    end 

    def show 
        posts = Post.find_by(id: params[:id])
        render json: posts.to_json(only: [:id, :image, :bio, :effect],
            include: [comments: { only: [:id, :comment], include: [user:{only: [:username]}]}, likes:{only: [:id, :user_id]}])
    end 

    def randomPosts
        post = Post.order(Arel.sql("RANDOM()")).limit(10)
        render json: post.to_json(only: [:id, :image, :effect])
    end
    private

    def post_params
        params.require(:post).permit(:bio, :pet_id, :posted, :image, :effect)
    end
end