class CreateFormEntries < ActiveRecord::Migration
  def self.up
    create_table :form_entries do |t|
      t.string  :name
      t.string  :last_name
      t.string  :phone
      t.string  :mobile
      t.string  :city
      t.string  :identifier
      t.string  :email
      t.string  :country
      t.text    :description
      t.string :service
      t.timestamps
    end
  end

  def self.down
    drop_table :form_entries
  end
end
