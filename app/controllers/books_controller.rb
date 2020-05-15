# frozen_string_literal: true

class BooksController < StandardItemController
  include Reportable
  def all
    @all_books = Book.all.order("title ASC")
    @total_book_count = Book.count
    @books_read_this_year = consumed_this_year(Book)
    @books_grouped_by_ratings = build_rating_chart(Book)
    render layout: "main"
  end

  def create
    @book = Book.new(book_params)
    super
  end

  def destroy
    @book = Book.find(params[:id])
    super
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @all_books = Book.all.order("updated_at DESC")
  end

  def new
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    @result = @book.update(book_params)
    super
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :authors,
      :url,
      :rating,
      :consumed_on
    )
  end
end
