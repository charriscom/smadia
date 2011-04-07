class CreateMicrosites < ActiveRecord::Migration
  def self.up
    create_table :microsites do |t|
      t.string      :name
      t.date        :published
      t.date        :closed
      t.text        :summary
      t.boolean     :home_page
      t.boolean     :section_page
      t.boolean     :external_page
      t.boolean     :other_category
      t.integer     :category_id
      t.text        :contenido
      t.boolean     :form
      t.timestamps
    end
  end

  def self.down
    drop_table :admins_microsites
  end
end
