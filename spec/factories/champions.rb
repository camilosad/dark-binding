FactoryGirl.define do
  factory :champion do
    riot_id 1
    name "Morgana"
    title "The fallen angel"
    lore Faker::Lorem.sentence
    image { {full: 'Morgana.png', sprite: "champion2.png"} }
    info { {attack: 1, defense: 6, magic: 8, difficulty: 1} }
    spells ""
    passive { {name: 'Sifao da Alma',
        sanitizedDescription: "Morgana tem Vampirismo Mágico, curando-se sempre que causa dano com suas habilidades."
        }
    }
  end
end
