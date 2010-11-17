class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.references :user
      t.string :feedback_title
      t.string :feedback_detail,:limit => 500
      t.string :ip_address

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
