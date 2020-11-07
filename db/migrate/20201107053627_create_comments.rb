class CreateComments < ActiveRecord::Migration[6.0]
  def up
    create_table :comments do |t|
      t.string :content
      t.references :commentable, polymorphic: true
      t.references :user, foreign_keys: true
      t.text :extra
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
