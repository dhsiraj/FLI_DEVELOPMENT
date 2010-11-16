class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :blog
      t.references :user
      t.string :comment_title
      t.string :comment_detail
      t.string :ip_address
      t.integer :comment_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
