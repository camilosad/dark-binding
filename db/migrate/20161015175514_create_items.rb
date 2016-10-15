class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :riot_id
      t.string :name
      t.string :description
      t.json :image
      t.json :gold

      t.timestamps
    end
  end
end
