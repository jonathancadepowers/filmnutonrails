# frozen_string_literal: true

class CommentsController < ApplicationController
  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = Comment.find(params[:id])
    @comment.delete
    data = {}
    data[:blog_post_comment_deleted] = @comment.destroyed?
    data[:blog_post_comment_count] = @blog_post.comments.count
    data[:comment_id] = @comment.id
    render json: data
  end
end

private

def comment_params
  params.require(:comment).permit(
    :author,
    :body
  )
end
