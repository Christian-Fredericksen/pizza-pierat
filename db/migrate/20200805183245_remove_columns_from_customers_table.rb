class RemoveColumnsFromCustomersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :first_name, :string
    remove_column :customers, :last_name, :string
    remove_column :customers, :street_address, :string
    remove_column :customers, :city, :string
    remove_column :customers, :state, :string
    remove_column :customers, :zip_code, :integer
    remove_column :customers, :phone_number, :string
  end
end
