module Sortings
  class SortCurrent
    def self.call(sort_selected: nil, relation: Constants::SORT_LIST)
      return Constants::SORT_ITEM_DEFAULT if sort_selected.nil?

      relation.detect { |sort| sort[:type] == sort_selected.to_sym } || Constants::SORT_ITEM_DEFAULT
    end
  end
end
