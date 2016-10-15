class RemoveRiotIdFromResources < ActiveRecord::Migration[5.0]
  def change
    remove_column :champions, :riot_id
    remove_column :items, :riot_id
  end
end
