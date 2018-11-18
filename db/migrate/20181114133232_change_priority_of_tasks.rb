class ChangePriorityOfTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :priority, 'integer USING CAST(state AS integer)', default: 0
    add_index :tasks, :priority
  end
end
