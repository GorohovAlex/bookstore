class PageController < ApplicationController
  def home
    @books_latest = Books::LastestBooks.call.decorate
    @books_best_sellers = Books::BestSellers.call.decorate
  end

  def catalog
    @categories = Categories::CategoriesAll.call
    @pagy, @books = pagy_countless(Books::CatalogBooks.new(Book.all).call(permitted_params).decorate,
                                   link_extra: 'data-remote="true"')
  end

  private

  def permitted_params
    params.permit(:category_id, :sort, :page)
  end
end
