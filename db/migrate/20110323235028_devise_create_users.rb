class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.string :identifier
      t.string :name
      t.string :middle_name
      t.string :last_name
      t.string :second_last_name
      t.string :login
      t.date   :birth_date
      t.string :profesion
      t.string :position
      t.string :business_name
      t.integer :business_phone
      t.integer :business_phone_ext
      t.string  :business_phone_type
      t.integer :phone
      t.string  :phone_type
      t.integer :mobile
      t.string  :address
      t.string  :address_type
      t.string  :country
      t.string  :state
      t.string  :city
      t.string  :email_type
      

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
