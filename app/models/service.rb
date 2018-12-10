class Service < ApplicationRecord

  validates :name, :description, :price, presence: true
  
  has_many :orders
  has_many :users, through: :orders

end
