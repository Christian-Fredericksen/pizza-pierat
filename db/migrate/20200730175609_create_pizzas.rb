class CreatePizzas < ActiveRecord::Migration[6.0]
  def change
    create_table :pizzas do |t|
      t.string :size
      t.string :crust
      t.string :cheese
      t.string :meats
      t.string :veggies
      t.integer :customer_id
      t.integer :order_id

      t.timestamps
    end
  end
end
