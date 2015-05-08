class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :role
      t.boolean :active
      t.string :contact
      t.string :email
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :type

      t.timestamps null: false
    end
  end
end
