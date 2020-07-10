class AddExtraToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :extra, :text
    rename_column :users, :password, :password_digest
    User.reset_column_information
  end
end
