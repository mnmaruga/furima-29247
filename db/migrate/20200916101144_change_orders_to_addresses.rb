class ChangeOrdersToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders, :addresses
  end
end
