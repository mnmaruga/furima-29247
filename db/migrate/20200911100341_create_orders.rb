class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item,   null: false,foreign_key: true
      t.string :postal,     null: false
      t.integer :prefect_id,null: false
      t.string :city,       null: false
      t.string :address,    null: false
      t.string :building
      t.string :tel,        null: false
      t.timestamps
    end
  end
end
