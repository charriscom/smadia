class AddPagosonlineToPromotion < ActiveRecord::Migration
  def self.up
    add_column :promotions, :pagos_online_form, :text
    add_column :promotions, :pagos_online_header, :string
  end

  def self.down
    remove_column :promotions, :pagos_online_header
    remove_column :promotions, :pagos_online_form
  end
end
