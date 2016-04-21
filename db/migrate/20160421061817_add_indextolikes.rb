class AddIndextolikes < ActiveRecord::Migration
  def change
    add_reference :likes, :photopost_id, index: true
  end
end
