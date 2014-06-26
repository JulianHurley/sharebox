class AddParentIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :parent_id, :integer
    add_index :assets, :parent_id
  end
end
