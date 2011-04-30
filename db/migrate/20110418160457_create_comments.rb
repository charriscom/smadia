class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string  :name
      t.date    :published
      t.date    :closed
      t.text    :content
      t.string  :signature
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
