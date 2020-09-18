class ChangeSalesToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_table :sales, :orders
  end
end
