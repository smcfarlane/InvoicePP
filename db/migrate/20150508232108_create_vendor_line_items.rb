class CreateVendorLineItems < ActiveRecord::Migration
  def change
    create_table :vendor_line_items do |t|
      t.string :item
      t.integer :value
      t.references :vendor_invoices

      t.timestamps null: false
    end
  end
end
