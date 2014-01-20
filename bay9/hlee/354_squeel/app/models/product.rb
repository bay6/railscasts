class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :category_id, :released_at, :discontinued_at, :stock

  #def self.search(query)
    #where("released_at <= ? and (discontinued_at is null or discontinued_at > ?) and stock >= ? and name like ?", Time.zone.now, Time.zone.now, 2, "%#{query}%")
  #end
  #
  def self.search(query)
    where do 
      (released_at <= Time.zone.now) & 
    ((discontinued_at == nil) | (discontinued_at < Time.zone.now)) & 
    (stock >= 2) & (name =~ "%#{query}%")
    end
  end
end
