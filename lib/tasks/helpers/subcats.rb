module Subcats

  def create_subcats
    @subcat1 = FactoryBot.create(:subcat, category: Category.find(1))
    @subcat2 = FactoryBot.create(:subcat, category: Category.find(1), name: 'Second Hand')
    @subcat3 = FactoryBot.create(:subcat, category: Category.find(3), name: 'Local Farmers')
    @subcat4 = FactoryBot.create(:subcat, category: Category.find(3), name: 'Green Grocery')
    @subcat5 = FactoryBot.create(:subcat, category: Category.find(2), name: 'Fancy')
    @subcat6 = FactoryBot.create(:subcat, category: Category.find(2), name: 'Casual')
    @subcat7 = FactoryBot.create(:subcat, category: Category.find(2), name: 'Cheap Eats')
    @subcat8 = FactoryBot.create(:subcat, category: Category.find(4), name: 'Energy')
    @subcat9 = FactoryBot.create(:subcat, category: Category.find(4), name: 'Waste')
    @subcat10 = FactoryBot.create(:subcat, category: Category.find(4), name: 'News', active: false)
    @subcat11 = FactoryBot.create(:subcat, category: Category.find(4), name: 'Hotels', active: false)
  end

end