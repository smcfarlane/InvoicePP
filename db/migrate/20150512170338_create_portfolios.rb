class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios, :id => false do |t|
      t.references :project, :null => false
      t.references :vendor, :null => false
      t.timestamps null: false
    end
  end
end
