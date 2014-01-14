class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :category_id, :released_at, :discontinued_at, :stock

  scope :released,          -> { where("released_at <= ?", Time.zone.now) }
  scope :not_discontinued,  -> { where("discontinued_at is null or discontinued_at > ?", Time.zone.now) }
  scope :in_stock,          -> { where("stock >= ?", 2) }
  scope :available,         -> { released.not_discontinued.in_stock }
  scope :search,            -> { available.where("name like ?", "%#{query}%") }

  def self.search(query)
    where("released_at <= ? and (discontinued_at is null or discontinued_at > ?) and stock >= ? and name like ?", Time.zone.now, Time.zone.now, 2, "%#{query}%")
  end

  def self.search1(query)
    where("released_at <= :now and (discontinued_at is null or discontinued_at > :now) and stock >= :stock and name like :query", now: Time.zone.now, stock: 2, query: "%#{query}%")
  end

  def self.search2(query)
    where(alel_table[:price].gt(query))
  end
  
  def self.search3(query)
    available.where(arel_table(:name).matches("%#{query}%"))
  end
end
