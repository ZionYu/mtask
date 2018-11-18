class AddDefaultValueToColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :state, default:0, 'integer USING CAST(state AS integer)'
  end
end
