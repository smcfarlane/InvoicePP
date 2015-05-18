class AddColumnsToClientInvoices < ActiveRecord::Migration
  def change
    change_table :client_invoices do |t|
      t.date :due_date
      t.string :identifier
    end
  end
end
