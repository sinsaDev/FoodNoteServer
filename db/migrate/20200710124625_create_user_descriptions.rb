class CreateUserDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_descriptions do |t|
      t.references :user, {null:false, foreign_key: true}
      t.text :address, null: false
      t.integer :gender, null: false
      t.integer :status, null: false
      t.integer :phone, null: false
      t.integer :grade, null: false
      t.integer :sns
      t.timestamps
    end
  end
end
