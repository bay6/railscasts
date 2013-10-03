class User
  module CsvConversion
    extend ActiveSupport::Concern

    module ClassMethods
      def to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << %w[id username email]
          all.each do |user|
            csv << [user.id, user.username, user.email]
          end
        end
      end
    end
  end
end
