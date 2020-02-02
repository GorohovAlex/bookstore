module Sortings
  class SortCurrent
    extend Constants

    def self.call(sort_selected: nil, relation: Constants::SORT_LIST)
      return Constants::SORT_ITEM_DEFAULT if sort_selected.nil?

      sort_item = relation.detect { |sort| sort[:type] == sort_selected.to_sym } || Constants::SORT_ITEM_DEFAULT
      sort_item
    end
  end
end
