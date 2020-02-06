class PageController < ApplicationController
  def home
    @books_latest = Books::LastestBooks.call
    @books_best_sellers = Books::BestSellers.call
  end
end
