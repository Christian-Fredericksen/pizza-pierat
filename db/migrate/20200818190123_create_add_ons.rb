class CreateAddOns < ActiveRecord::Migration[6.0]
  def change
    create_table :add_ons do |t|
      t.references :pizza, null: false, foreign_key: true
      t.references :topping, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
