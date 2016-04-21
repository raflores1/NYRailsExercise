class Deletingliketable < ActiveRecord::Migration
  def change
    drop_table :likes
  end
end
