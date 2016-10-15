FactoryGirl.define do
  factory :champion do
    name "Morgana"
    title "The fallen angel"
    lore Faker::Lorem.sentence
    image { {full: 'Morgana.png', sprite: "champion2.png"} }
    info { {attack: 1, defense: 6, magic: 8, difficulty: 1} }

    spells { [
        {"name"=>"Ligação das Trevas",
            "sanitizedDescription"=> "Morgana dispara uma esfera de magia negra."},
        {"name"=>"Solo Atormentado",
            "sanitizedDescription"=> "Infecta uma área com solo profano."},
        {"name"=>"Escudo Negro",
            "sanitizedDescription"=> "Posiciona uma barreira protetora em um campeão aliado."},
        {"name"=>"Grilhões da Alma",
            "sanitizedDescription"=> "Prende correntes de energia em campeões inimigos próximos."}
        ]
    }

    passive { {name: 'Sifao da Alma',
        sanitizedDescription: "Morgana tem Vampirismo Mágico, curando-se sempre que causa dano com suas habilidades."
        }
    }
  end

end
