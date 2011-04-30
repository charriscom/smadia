class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.integer     :category_id
      t.decimal     :value
      t.integer     :discount
      t.decimal     :discount_value
      t.date        :published
      t.date        :closed
      t.string      :title
      t.text        :terms
      t.text        :summary
      t.text        :content
      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
