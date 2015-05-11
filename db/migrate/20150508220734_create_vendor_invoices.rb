class CreateVendorInvoices < ActiveRecord::Migration
  def change
    create_table :vendor_invoices do |t|
      t.references :vender
      t.references :project
      t.integer :total
      t.boolean :flat_fee
      t.boolean :entered
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
