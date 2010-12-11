class CreateTopLinks < ActiveRecord::Migration
  def self.up
    create_table :top_links do |t|
      t.string :title
      t.string :link_url
      t.string :category
      t.integer :flag

      t.timestamps
    end
  end

  def self.down
    drop_table :top_links
  end
end
