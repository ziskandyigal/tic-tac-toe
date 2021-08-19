class Api::V1::CommentsController < ApplicationController
    def byemail
        render json: Comment.joins(:user).all.group(params[:email])
    end

    def create
        user = User.find_by email: params[:email]
        comment = user.comments.build(comments_params)
        
        if comment.save
            render json: comment, status: :created
        else
            render json: { 
                errors: comment.errors
            }, 
            status: :unprocessable_entity
        end
    end

    private

    def comments_params
        params.require(:comment).permit(:text)
    end
end
