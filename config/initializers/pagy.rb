require 'pagy/extras/countless'
require 'pagy/extras/support'

Rails.application.config.assets.paths << Pagy.root.join('javascripts')
Pagy::VARS[:items] = Constants::PAGY_COUNT_DEFAULT
