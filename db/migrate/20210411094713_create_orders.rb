class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :ordered
      t.references :attended_order

      t.timestamps
    end
  end
end
