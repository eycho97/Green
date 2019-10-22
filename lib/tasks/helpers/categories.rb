module Populator
  module Categories

    def create_categories
      @cat1 = FactoryBot.create(:category)
      @cat2 = FactoryBot.create(:category, name: 'Restaurants')
      @cat3 = FactoryBot.create(:category, name: 'Food')
      @cat4 = FactoryBot.create(:category, name: 'Energy')
      @cat5 = FactoryBot.create(:category, name: 'Home Goods', active: false)
    end

  end
end