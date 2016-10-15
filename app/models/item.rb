class Item < ApplicationRecord
  has_many :recommended_items, dependent: :destroy
  has_many :champions, through: :recommended_items

  def image_url
    image
  end

  def gold_total
    gold
  end
end

