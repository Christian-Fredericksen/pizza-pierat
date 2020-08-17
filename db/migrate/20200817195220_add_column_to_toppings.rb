class AddColumnToToppings < ActiveRecord::Migration[6.0]
  def change
    add_column :toppings, :pizza_id, :integer
  end
end
