module Subcat

  def create_subcats
    @subcat1 = FactoryBot.create(:subcat, category: Category.find(1))
    @subcat2 = FactoryBot.create(:subcat, category: Category.find(1), name: 'Second Hand')
    @subcat5 = FactoryBot.create(:subcat, category: Category.find(3), name: 'Local Farmers')
    @subcat6 = FactoryBot.create(:subcat, category: Category.find(3), name: 'Green Grocery')
    @subcat7 = FactoryBot.create(:subcat, category: Category.find(2), name: 'Fancy')
    @subcat8 = FactoryBot.create(:subcat, category: Category.find(2), name: 'Casual')
    @subcat9 = FactoryBot.create(:subcat, category: Category.find(2), name: 'Cheap Eats')
    @subcat11 = FactoryBot.create(:subcat, category: Category.find(4), name: 'Energy')
    @subcat12 = FactoryBot.create(:subcat, category: Category.find(4), name: 'Waste')
    @subcat13 = FactoryBot.create(:subcat, category: Category.find(4), name: 'News', active: false)
    @subcat14 = FactoryBot.create(:subcat, category: Category.find(4), name: 'Hotels', active: false)
  end

end