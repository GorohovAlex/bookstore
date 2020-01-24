module Books
  class CatalogBooks
    attr_accessor :initial_scope

    def initialize(initial_scope)
      @initial_scope = initial_scope
    end

    def call(params)
      scoped = filter_by_category(initial_scope, params[:category_id])
      # scoped = sort(scoped, params[:sort_type], params[:sort_direction])
      # scoped = paginate(scoped, params[:page])
      scoped
    end

    private

    def filter_by_category(scoped, category_id = nil)
      category_id ? scoped.where(category_id: category_id) : scoped
    end

    # def sort(scoped, _sort_type = :desc, sort_direction = :price)
    #   scoped.order(sort_type: sort_direction)
    # end

    # def paginate(scoped, page_number = 0)
    #   scoped.page(page_number)
    # end
  end
end
