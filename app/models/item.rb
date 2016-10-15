class Item < ApplicationRecord

  has_many :recommended_items, dependent: :destroy
  has_many :champions, through: :recommended_items

  def image_full
    image['full']
  end

  def image_url
    "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/item/#{image_full}"
  end

  def gold_total
    gold['total']
  end

end

