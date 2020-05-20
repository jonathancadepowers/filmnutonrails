# frozen_string_literal: true

class BlogPostsController < StandardItemController
  include Reportable
  skip_before_action :authenticate_user!, only: %i[all show]
  before_action :hydrate_sidebar_data, only: [:all, :show]

  def all
    @all_blog_posts = BlogPost.all.order("created_at DESC").limit(10)    
    render layout: "main"
  end

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

  def show
    # Stores the single blog post object as an array
    # in order to render the same partial for both the
    # #show and #all actions in each of their respectives views.
    @single_blog_post_as_array = []
    @single_blog_post_as_array << BlogPost.find(params[:id])
    render layout: "main"
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
    :body,
    :created_at
  )
end

def hydrate_sidebar_data
  @last_10_films_consumed = last_n_consumed(Film, 10)
  @last_10_shows_consumed = last_n_consumed(TvShow, 10)
  @last_10_books_consumed = last_n_consumed(Book, 10)
end
