class PageController < ApplicationController
  def home
    @books_latest = Book.last(3)
  end
end
