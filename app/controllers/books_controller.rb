# frozen_string_literal: true

class BooksController < StandardItemController
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
      :url,
      :rating,
      :consumed_on
    )
  end
end
