# frozen_string_literal: true

class BlogPostsController < StandardItemController
  skip_before_action :authenticate_user!, only: %i[all show archives tag year]
  before_action :hydrate_sidebar_data, only: %i[all show archives year tag]

  def all
    @all_blog_posts = BlogPost.all.order("created_at DESC").limit(25)
    render layout: "main"
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @display_timestamp = @blog_post.created_at
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
    @object = BlogPost.find(params[:id])
    @object_result = @object.update(blog_post_params)
    @display_timestamp = @object.created_at
    super
  end

  def archives
    @tag_cloud = BlogPost.tag_counts_on(:tags)
    @posts_by_year = BlogPost.posts_by_year
    @recommended_posts = BlogPost.where(recommended: true)
    render layout: "main"
  end

  def tag
    @tagged_posts = BlogPost.tagged_with(params[:tag])
    @requested_tag = params[:tag]
    render layout: "main"
  end

  def year
    @posts_in_year = BlogPost.where("extract(year from created_at) = ?",
                                    params[:year])
    @requsted_year = params[:year]
    render layout: "main"
  end
end

private

def blog_post_params
  params.require(:blog_post).permit(
    :title,
    :body,
    :created_at,
    :tag_list,
    :recommended
  )
end
