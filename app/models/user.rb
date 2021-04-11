class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_products, foreign_key: 'supplier_id', class_name: 'Product'
  has_many :orders, foreign_key: 'ordered_id'
  has_many :attended_orders, through: :orders
  validates :name, presence: true, length: { minimum: 2 }
end
