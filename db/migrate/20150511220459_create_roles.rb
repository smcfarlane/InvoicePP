class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role
      t.references :user
      t.integer :ref_id

      t.timestamps null: false
    end
  end
end
