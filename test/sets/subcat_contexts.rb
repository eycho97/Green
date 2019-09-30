module Contexts
  module SubcatContexts

    def create_subcats
      @subcat1 = FactoryBot.create(:subcat, category: @cat1)
      @subcat2 = FactoryBot.create(:subcat, category: @cat1, name: 'Second Hand')
      @subcat3 = FactoryBot.create(:subcat, category: @cat3, name: 'Local Farmers')
      @subcat4 = FactoryBot.create(:subcat, category: @cat3, name: 'Green Grocery')
      @subcat5 = FactoryBot.create(:subcat, category: @cat2, name: 'Fancy')
      @subcat6 = FactoryBot.create(:subcat, category: @cat2, name: 'Casual')
      @subcat7 = FactoryBot.create(:subcat, category: @cat2, name: 'Cheap Eats')
      @subcat8 = FactoryBot.create(:subcat, category: @cat4, name: 'Energy')
      @subcat9 = FactoryBot.create(:subcat, category: @cat4, name: 'Waste')
      @subcat10 = FactoryBot.create(:subcat, category: @cat4, name: 'News', active: false)
      @subcat11 = FactoryBot.create(:subcat, category: @cat4, name: 'Hotels', active: false)
    end

    def delete_subcats
      @subcat1.delete
      @subcat2.delete
      @subcat3.delete
      @subcat4.delete
      @subcat5.delete
      @subcat6.delete
      @subcat7.delete
      @subcat8.delete
      @subcat9.delete
      @subcat10.delete
      @subcat11.delete      
    end

  end
end