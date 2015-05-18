class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :item
      t.integer :value
      t.references :client_invoice

      t.timestamps null: false
    end
  end
end
