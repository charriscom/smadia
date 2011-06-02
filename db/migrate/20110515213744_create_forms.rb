class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string      :name
      t.text        :usage
      t.text        :response
      t.text        :website
      t.text        :footer
      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
