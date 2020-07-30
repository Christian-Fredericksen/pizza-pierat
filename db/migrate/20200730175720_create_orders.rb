class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :line_item
      t.text :line_description
      t.integer :quantity
      t.integer :line_price
      t.integer :total
      t.datetime :date_time

      t.timestamps
    end
  end
end
