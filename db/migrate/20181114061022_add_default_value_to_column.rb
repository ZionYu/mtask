class AddDefaultValueToColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :state, 'integer USING CAST(state AS integer)'
  end
end
