class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :users, {null: false, foreign_keys: true}
      t.string :name, null: false
      t.integer :status, null: false
      t.string :deleted, null: false
      t.timestamps
    end
  end
end
