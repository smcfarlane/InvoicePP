class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :identifier
      t.references :client
      t.text :details

      t.timestamps null: false
    end

    create_table :project_vendor, :id => false do |t|
      t.references :project, :null => false
      t.references :vendor, :null => false
    end
  end
end
