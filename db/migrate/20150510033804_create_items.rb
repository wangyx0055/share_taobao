class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, id: :uuid do |t|
      t.text :url
      t.string :title
      t.text :image_url
      t.string :short_url

      t.timestamps null: false
    end
    
    add_index :items, :short_url, unique: true
  end
end
