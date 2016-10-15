class Champion < ApplicationRecord
  extend HashMethods

  default_scope {order :name}

  simple_hash_methods :image, :full, :sprite
  simple_hash_methods :info, :attack, :defense, :magic, :difficulty
  simple_hash_methods :passive, :name, :sanitizedDescription

  def image_url
    "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/champion/#{image['full']}"
  end

  def image_full
    image['full']
  end

  def image_sprite
    image['sprite']
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

  def passive_name
    passive["name"]
  end

  def passive_description
    passive["sanitizedDescription"]
  end
end
