class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :photopost_id
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
