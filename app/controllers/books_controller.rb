class BooksController < ApplicationController
  def show
    @book = Book.find_by_id!(params[:id]).decorate
    @review = Review.new(book_id: @book.id)
  end
end
