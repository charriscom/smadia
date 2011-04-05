class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string  :name
      t.text    :description
      t.boolean :user_create
      t.boolean :user_edit
      t.boolean :user_delete
      t.boolean :user_view
      t.boolean :user_export
      
      t.boolean :category_create
      t.boolean :category_edit
      t.boolean :category_delete
      t.boolean :category_view
      t.boolean :category_export
      
      t.boolean :article_create
      t.boolean :article_edit
      t.boolean :article_delete
      t.boolean :article_view
      t.boolean :article_export
      
      t.boolean :promotion_create
      t.boolean :promotion_edit
      t.boolean :promotion_delete
      t.boolean :promotion_view
      t.boolean :promotion_export
      
      t.boolean :video_create
      t.boolean :video_edit
      t.boolean :video_delete
      t.boolean :video_view
      t.boolean :video_export
      
      t.boolean :microsite_create
      t.boolean :microsite_edit
      t.boolean :microsite_delete
      t.boolean :microsite_view
      t.boolean :microsite_export
      
      t.boolean :comment_create
      t.boolean :comment_edit
      t.boolean :comment_delete
      t.boolean :comment_view
      t.boolean :comment_export
      
      t.boolean :socail_network_create
      t.boolean :socail_network_edit
      t.boolean :socail_network_delete
      t.boolean :socail_network_view
      t.boolean :socail_network_export
      
      t.boolean :form_create
      t.boolean :form_edit
      t.boolean :form_delete
      t.boolean :form_view
      t.boolean :form_export
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
