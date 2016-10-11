class CreateChampions < ActiveRecord::Migration[5.0]
  def change
    create_table :champions do |t|
      t.integer :riot_id
      t.string :name
      t.string :title
      t.text :lore
      t.json :image
      t.json :info
      t.json :spells
      t.json :passive

      t.timestamps
    end
  end
end
