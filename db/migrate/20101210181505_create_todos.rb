class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :title
      t.string :todo_type
      t.string :priority
      t.string :desc
      t.string :status
      t.integer :flag
      t.datetime :todo_date

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
