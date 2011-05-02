class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :category_id
      t.date    :published
      t.date    :closed
      t.string  :title
      t.text    :highlights
      t.text    :content
      t.boolean :carrusel, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
