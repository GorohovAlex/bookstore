class PageController < ApplicationController
  def home
    @books_latest = Book.last(3)
    @books_best_sellers = Book.last(4)
  end
end
