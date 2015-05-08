class CreateClientInvoices < ActiveRecord::Migration
  def change
    create_table :client_invoices do |t|
      t.references :client
      t.references :project
      r.references :user
      t.integer :total
      t.boolean :flat_fee
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
