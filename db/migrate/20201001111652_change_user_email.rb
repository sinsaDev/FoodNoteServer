class ChangeUserEmail < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :phone, :string, :null => true
    change_column :users, :name, :string, :null => true
    change_column :users, :nickname, :string, :null => true
  end
end
