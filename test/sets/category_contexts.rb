module Contexts
  module CategoryContexts

    def create_categories
      @cat1 = FactoryBot.create(:category)
      @cat2 = FactoryBot.create(:category, name: 'Restaurants')
      @cat3 = FactoryBot.create(:category, name: 'Food')
      @cat4 = FactoryBot.create(:category, name: 'Energy')
      @cat5 = FactoryBot.create(:category, name: 'Home Goods', active: false)
    end
    
    def destroy_categories
      @cat1.delete
      @cat2.delete
      @cat3.delete
      @cat4.delete
      @cat5.delete
    end

  end
end