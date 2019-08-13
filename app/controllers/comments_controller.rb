# frozen_string_literal: true

class CommentsController < ApplicationController
  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = Comment.find(params[:id])
    @comment.delete
    render json: @comment
  end
end

private

def comment_params
  params.require(:comment).permit(
    :author,
    :body
  )
end
