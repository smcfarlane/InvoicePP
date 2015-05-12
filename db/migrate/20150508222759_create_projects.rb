class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :identifier
      t.references :client
      t.text :details

      t.timestamps null: false
    end
  end
end
