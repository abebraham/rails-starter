# config/initializers/kaminari.rb
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end

module ActiveRecord
  class Relation
    alias_method :total_count, :count
  end
end