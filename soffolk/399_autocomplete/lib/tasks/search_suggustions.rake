namespace :search_suggustions do
  desc "Generate search suggestions from products"
  task :index => :environment do
    SearchSuggustion.index_products
  end
end
