class RemoveColumnandchangename < ActiveRecord::Migration
  def change
    change_table :likes do |t|
      t.remove :photopost_id
      t.rename :photopost_id_id, :photopost_id
    end
  end
end
