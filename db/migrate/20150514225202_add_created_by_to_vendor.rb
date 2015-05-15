class AddCreatedByToVendor < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.integer :created_by
    end
  end
end
