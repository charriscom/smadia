class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.boolean     :home_page
      t.string      :title
      t.date        :published
      t.date        :closed
      t.string      :link
      t.text        :description
      t.integer     :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
