class AddPasswordToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :password, :string
  end
end
