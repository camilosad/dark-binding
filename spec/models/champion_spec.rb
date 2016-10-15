require 'rails_helper'

RSpec.describe Champion, type: :model do

  describe "relationships" do
    it {should have_many(:recommended_items)}
    it {should have_many(:items).through(:recommended_items)}
  end

  describe "instance_methods" do
    let(:champion) { build(:champion) }

    context "json fields" do
      it "#image_full" do
        expect(champion.image_full).to eq "Morgana.png"
      end

      it "#info_attack" do
        expect(champion.info_attack).to eq 1
      end

      it "#info_defense" do
        expect(champion.info_defense).to eq 6
      end

      it "#info_defense" do
        expect(champion.info_magic).to eq 8
      end

      it "#info_difficulty" do
        expect(champion.info_difficulty).to eq 1
      end

      it "#passive_name" do
        expect(champion.passive_name).to eq "Sifao da Alma"
      end

      it "#passive_description" do
        expect(champion.passive_description).to eq "Morgana tem Vampirismo Mágico, curando-se sempre que causa dano com suas habilidades."
      end

      it "#spells_simplified" do
        expect(champion.spells_simplified).to have_key("Ligação das Trevas")
        expect(champion.spells_simplified).to have_key("Solo Atormentado")
        expect(champion.spells_simplified).to have_key("Escudo Negro")
        expect(champion.spells_simplified).to have_key("Grilhões da Alma")
      end

    end

    it "#image_url" do
      expect(champion.image_url).to eq "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/champion/Morgana.png"
    end

  end
end
