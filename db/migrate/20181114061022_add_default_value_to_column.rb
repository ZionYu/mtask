class AddDefaultValueToColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :state, :integer, default: 0
  end
end
