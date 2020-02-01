module Constants
  SORT_LIST = [
    { type: :newest_first,  value: 'Newest first' },
    { type: :popular_first, value: 'Popular first' },
    { type: :price_asc,     value: 'Price: Low to hight' },
    { type: :price_desc,    value: 'Price: Hight to low' },
    { type: :price_desc,    value: 'Title: A - Z' },
    { type: :price_desc,    value: 'Title: Z - A' }
  ].freeze

  NAME_MAX_LENGTH = 50
  TITLE_MAX_LENGTH = 80
  TEXTBOX_MAX_LENGTH = 500

  REGEX_LETTER_ONLY = /\A[a-zA-Z]+\z/.freeze
  REGEX_TITLE = %r{\A[a-zA-Z!#$%&'*+-\/=?^_`{|}~\s]+\z}.freeze

  YEAR_MAX_LENGTH = 4
end
