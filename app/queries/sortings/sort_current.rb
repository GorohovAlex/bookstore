module Sortings
  class SortCurrent
    extend Constants

    def self.call(sort_selected, relation: Constants::SORT_LIST)
      return relation[0][:value] if sort_selected.nil?

      sort_item = relation.detect { |sort| sort[:type] == sort_selected.to_sym } || relation[0]
      sort_item[:value]
    end
  end
end
