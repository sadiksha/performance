class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :category_id

  validates :name, :price, :category_id, presence: true

  belongs_to :category
end
