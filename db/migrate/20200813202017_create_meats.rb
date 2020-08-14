class CreateMeats < ActiveRecord::Migration[6.0]
  def change
    create_table :meats do |t|
      t.string :name

      t.timestamps
    end
  end
end
