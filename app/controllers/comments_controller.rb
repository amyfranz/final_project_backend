class CommentsController < ApplicationController
    def create 
        comment = Comment.create(comment_params)
        if comment.valid?
            render json: comment.post.to_json(only: [:id, :image, :bio, :effect],
                include: [comments: { only: [:id, :comment], include: [user:{only: [:username]}]}, likes:{only: [:id, :user_id]}])
        else
            render json: {message: "did not create a new comment"}
        end
    end

    def index 
        comments = Comment.all
        render json: comments.to_json(only: [:id, :comment],
            include: [user: { only: [:username]}])
    end 

    private

    def comment_params
        params.require(:comment).permit(:post_id, :user_id, :comment, :created_at)
    end
end