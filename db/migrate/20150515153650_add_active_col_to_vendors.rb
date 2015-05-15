class AddActiveColToVendors < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.boolean :active
    end
  end
end
