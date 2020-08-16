class RemoveColumnsFromPizzasTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :pizzas, :meats, :string
    remove_column :pizzas, :veggies, :string
    remove_column :pizzas, :order_id, :integer
  end
end
