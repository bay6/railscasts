namespace :fnordmetric do
  desc "Populate Fnordmertic with events to simulate user activity"
  task :populate => :environment do
    products = Product.all
    loop do
      products.sample.trigger_view_event
      sleep(rand)
    end
  end
end
