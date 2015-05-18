class AddActiveColToClientInvoices < ActiveRecord::Migration
  def change
    change_table :client_invoices do |t|
      t.boolean :active
    end
  end
end
