module Categories
  class CategoriesAll
    def self.call(relation: Category.all)
      relation.order(name: :asc)
    end
  end
end
