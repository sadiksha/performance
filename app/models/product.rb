class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price

  validates :name, :price, presence: true
end
