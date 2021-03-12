class CreateInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :infomations do |t|
      t.string :build
      t.string :address_number,               null: false
      t.integer :shopping_address_id,            null: false
      t.string :city,               null: false
      t.string :address,        null: false
      t.string :phone_number,    null: false
      t.references :order,                foreign_key: true


      t.timestamps
    end
  end
end
