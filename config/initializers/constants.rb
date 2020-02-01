module Constants

  SORT_ITEM_DEFAULT = :title_asc
  SORT_LIST = [
    { type: :newest_first,  value: 'Newest first' },
    { type: :popular_first, value: 'Popular first' },
    { type: :price_asc,     value: 'Price: Low to hight' },
    { type: :price_desc,    value: 'Price: Hight to low' },
    { type: :title_asc,    value: 'Title: A - Z' },
    { type: :title_desc,    value: 'Title: Z - A' }
  ].freeze

  REGEX_LETTER_ONLY = /\A[a-zA-Z]+\z/.freeze
  REGEX_TITLE = %r{\A[a-zA-Z!#$%&'*+-\/=?^_`{|}~\s]+\z}.freeze
end
