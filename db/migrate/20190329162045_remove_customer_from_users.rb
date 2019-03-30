class RemoveCustomerFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column(:users, :customer)
  end
end
