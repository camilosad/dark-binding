class Champion < ApplicationRecord

  default_scope {order :name}

  has_many :recommended_items, dependent: :destroy
  has_many :items, through: :recommended_items

  def image_url
    "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/champion/#{image_full}"
  end

  def image_full
    image['full']
  end

  def info_attack
    info['attack']
  end

  def info_defense
    info['defense']
  end

  def info_magic
    info['magic']
  end

  def info_difficulty
    info['difficulty']
  end

  def passive_name
    passive['name']
  end

  def passive_description
    passive['sanitizedDescription']
  end

  def spells_simplified
    h = {}
    spells.each do |spell|
      h.store(spell["name"], spell["sanitizedDescription"])
    end
    h
  end
end
