class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.boolean :active
      t.references :manager
      t.references :user
      t.references :detail
      t.timestamps null: false
    end
  end
end
