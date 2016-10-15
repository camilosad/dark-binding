class CreateRecommendedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :recommended_items do |t|
      t.references :champion, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
