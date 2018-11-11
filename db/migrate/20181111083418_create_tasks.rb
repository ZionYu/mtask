class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :state
      t.string :priority
      t.datetime :deadline
      t.integer :user_id
      t.timestamps
    end
  end
end
