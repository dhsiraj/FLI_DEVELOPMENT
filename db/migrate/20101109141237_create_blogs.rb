class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.references :user
      t.string :blog_title
      t.string :blog_desc, :limit => 200
      t.string :blog_detail, :limit => 1500
      t.datetime :posted_on
      t.integer :blog_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
