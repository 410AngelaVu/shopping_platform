class Order < ApplicationRecord
  belongs_to :ordered, class_name: 'User'
  belongs_to :attended_order, class_name: 'Product'
  validates :ordered_id, presence: true
end
