class AddDefaultValueToColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :state, default: 0, using: 'state::integer'
  end
end
