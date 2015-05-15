class AddActiveColumnToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.boolean :active
    end
  end
end
