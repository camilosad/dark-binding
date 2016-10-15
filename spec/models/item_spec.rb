require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "relationships" do
    it {should have_many(:champions)}
    it {should have_many(:champions).through(:recommended_items)}
  end

end
