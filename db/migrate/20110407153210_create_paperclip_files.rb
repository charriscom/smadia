class CreatePaperclipFiles < ActiveRecord::Migration
  def self.up
    create_table :paperclip_files do |t|
      t.string     :file_file_name
      t.string     :file_content_type
      t.integer    :file_file_size
      t.datetime   :file_updated_at
      t.string     :purpose
      t.references :owner, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :paperclip_files
  end
end
