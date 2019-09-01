# frozen_string_literal: true

class BlogPostsController < StandardItemController
  def create
    @blog_post = BlogPost.new(blog_post_params)
    super
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    super
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    @comments = @blog_post.comments
  end

  def index
    @all_blog_posts = BlogPost.all.order("updated_at DESC")
  end

  def new
    @blog_post = BlogPost.new
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    @result = @blog_post.update(blog_post_params)
    super
  end
end

private

def blog_post_params
  params.require(:blog_post).permit(
    :title,
    :body
  )
end
