class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.integer :statue
      t.string :name, null: false
      t.string :nickname, null: false
      t.integer :sns
      t.timestamps
    end
  end
end
