class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :art_title
      t.string :art_type
      t.string :art_source
      t.string :art_desc, :limit => 200
      t.text :art_detail
      t.string :art_link
      t.integer :art_flag
      t.datetime :art_date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
