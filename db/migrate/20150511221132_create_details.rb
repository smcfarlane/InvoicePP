class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :name
      t.string :title
      t.string :type
      t.timestamps null: false
    end
  end
end
