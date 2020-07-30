class CreatePizzas < ActiveRecord::Migration[6.0]
  def change
    create_table :pizzas do |t|
      t.string :size
      t.text :toppings
      t.string :crust
      t.integer :price

      t.timestamps
    end
  end
end
