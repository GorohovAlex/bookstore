module Books
  class CatalogBooks
    attr_accessor :initial_scope

    def initialize(initial_scope)
      @initial_scope = initial_scope
    end

    def call(params)
      sorting = Sortings::SortCurrent.call(sort_selected: params[:sort])
      scoped = filter_by_category(initial_scope, params[:category_id])
      scoped = sort(scoped, sorting[:sort_field], sorting[:sort_direction])
      scoped
    end

    private

    def filter_by_category(scoped, category_id = nil)
      category_id ? scoped.where(category_id: category_id) : scoped
    end

    def sort(scoped, sort_field = :id, sort_direction = :desc)
      scoped.order(sort_field => sort_direction)
    end
  end
end
