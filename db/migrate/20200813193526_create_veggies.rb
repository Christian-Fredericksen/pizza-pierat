class CreateVeggies < ActiveRecord::Migration[6.0]
  def change
    create_table :veggies do |t|
      t.string :type

      t.timestamps
    end
  end
end
