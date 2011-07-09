class AddMicrositeIdAndPromotionIdToForm < ActiveRecord::Migration
  def self.up
    add_column :forms, :microsite_id, :integer
    add_column :forms, :promotion_id, :integer
  end

  def self.down
    remove_column :forms, :promotion_id
    remove_column :forms, :microsite_id
  end
end
