class Tenant < ActiveRecord::Base
  attr_accessible :subdomain, :name
  after_create :create_schema

  def create_schema
    connection.execute("create schema tenant#{id}")
    scope_schema do
      load Rails.root.join("db/schema.rb")
      connection.execute("drop table #{self.class.table_name}")
    end
  end

  def scope_schema(*paths)
    original_search_path = connection.schema_search_path
    connection.schema_search_path = ["tenant#{id}", *paths].join(",")
    yield
  ensure
    connection.schema_search_path = original_search_path
  end
end
