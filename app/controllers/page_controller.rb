class PageController < ApplicationController
  def home
    @books_latest = Books::LastestBooks.call
    @books_best_sellers = Books::BestSellers.call
  end

  def catalog
    @books = Books::CatalogBooks.new(Book.all).call(permitted_params)
  end

  def permitted_params
    params.permit(:category_id, :sort_direction, :sort_type, :page)
  end
end
