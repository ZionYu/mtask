class AddIndexToTasksState < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :state
  end
end
