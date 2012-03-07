class AddFblikeToMicrosites < ActiveRecord::Migration
  def self.up
    add_column :microsites, :fblike, :boolean, :default => false
  end

  def self.down
    remove_column :microsites, :fblike
  end
end
