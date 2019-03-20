class AddCustomerToUsers < ActiveRecord::Migration[5.2]
  def up
  	add_column(:users, :customer, :boolean)
  	add_column(:users, :employee, :boolean)
  end

  def down
  	remove_column(:users, :customer)
  	remove_column(:users, :employee)
  end
end
