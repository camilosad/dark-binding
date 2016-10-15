require 'rails_helper'

RSpec.describe Champion, type: :model do

  describe "instance_methods" do
    let(:champion) { build(:champion) }

    context "json fields" do
      it "should have methods for image" do
        expect(champion).to respond_to(:image_full)
        expect(champion).to respond_to(:image_sprite)
      end

      it "should have methods for info" do
        expect(champion).to respond_to(:info_attack)
        expect(champion).to respond_to(:info_defense)
        expect(champion).to respond_to(:info_magic)
        expect(champion).to respond_to(:info_difficulty)
      end

      it "should have methods for passive" do
        expect(champion).to respond_to(:passive_name)
        expect(champion).to respond_to(:passive_description)
      end
    end

    it "#image_url" do
      expect(champion.image_url).to eq "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/champion/Morgana.png"
    end

  end
end
