class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.references :detail
      t.references :user

      t.timestamps null: false
    end
  end
end
