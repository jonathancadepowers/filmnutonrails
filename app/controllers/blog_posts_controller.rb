# frozen_string_literal: true

class BlogPostsController < ApplicationController
  def create
    @blog_post = BlogPost.new(blog_post_params)
    super # Parent method lives in ApplicationController.
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    super # Parent method lives in ApplicationController.
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    @comments = @blog_post.comments
  end

  def index
    @all_blog_posts = BlogPost.all.order("created_at DESC")
  end

  def new
    @blog_post = BlogPost.new
  end

  def update
    @result = BlogPost.find(params[:id]).update(blog_post_params)
    super # Parent method lives in ApplicationController.
  end
end

private

def blog_post_params
  params.require(:blog_post).permit(
    :title,
    :body
  )
end
