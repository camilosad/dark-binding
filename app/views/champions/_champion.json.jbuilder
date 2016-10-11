json.extract! champion, :id, :riot_id, :name, :title, :lore, :image, :info, :spells, :passive, :created_at, :updated_at
json.url champion_url(champion, format: :json)