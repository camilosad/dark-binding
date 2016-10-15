require 'rails_helper'

RSpec.describe RecommendedItem, type: :model do

  describe "relationships" do
    it {should belong_to(:champion)}
    it {should belong_to(:item)}
  end

end
