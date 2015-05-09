class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :active
      t.references :manager
      t.references :user

      t.timestamps null: false
    end
  end
end
