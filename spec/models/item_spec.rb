require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "relationships" do
    it {should have_many(:champions)}
    it {should have_many(:champions).through(:recommended_items)}
  end

  describe "instance_methods" do
    let(:item) { build(:item) }

    context "json fields" do
      it "#image_full" do
        expect(item.image_full).to eq "3092.png"
      end

      it "#gold_total" do
        expect(item.gold_total).to eq "2200"
      end
    end

    it "#image_url" do
      expect(item.image_url).to eq "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/item/3092.png"
    end
  end

end
