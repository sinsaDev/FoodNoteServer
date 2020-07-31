class ChangeStatusToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :statue, :status
    change_column :users, :status, :integer, :null => false, :default => 0
    change_column :users, :sns, :integer, :null => false, :default => 0
    User.reset_column_information

  end
end
