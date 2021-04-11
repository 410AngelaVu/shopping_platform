class Product < ApplicationRecord
  belongs_to :supplier, foreign_key: 'supplier_id', class_name: 'User'
  has_many :orders, foreign_key: 'attended_order_id'
  has_many :ordereds, through: :orders

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { in: 2..5000 }
  validates :quantity, presence: true
end
