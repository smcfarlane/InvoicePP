class CovertIntColsToDecimalForCurrency < ActiveRecord::Migration
  def change
    change_column(:line_items, :value, :decimal, precision: 10, scale: 2)
    change_column(:client_invoices, :total, :decimal, precision: 10, scale: 2)
    change_column(:vendor_line_items, :value, :decimal, precision: 10, scale: 2)
    change_column(:vendor_invoices, :total, :decimal, precision: 10, scale: 2)
  end
end
