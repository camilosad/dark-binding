FactoryGirl.define do
  factory :item do
    name "Asserção da Rainha Gélida"
    description "Envia fantasmas que buscam campeões inimigos e lhes causam lentidão"
    image { {"full"=>"3092.png"} }
    gold { {"total"=>"2200"} }
  end
end
