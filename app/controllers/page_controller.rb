class PageController < ApplicationController
  def home
    @books_latest = Books::LastestBooks.call.decorate
    @books_best_sellers = Books::BestSellers.call.decorate
  end

  def catalog
    @categories = Categories::CategoriesAll.call
    @books = Books::CatalogBooks.new(Book.all).call(permitted_params).decorate
  end

  def permitted_params
    params.permit(:category_id, :sort_direction, :sort_type, :page)
  end
end
