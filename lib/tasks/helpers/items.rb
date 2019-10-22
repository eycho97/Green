module Populator
  module Items

    def create_items
      @item2 = FactoryBot.create(:item, title: 'Green Clothes', link: 'http://greenclothes2.com')
      @item3 = FactoryBot.create(:item, title: 'Clothes Green', link: 'http://clothesgreen.com')
      @item4 = FactoryBot.create(:item, title: 'Vintage Clothes', picture: nil, link: 'http://vintageclothes.com', featured: true)
      @item5 = FactoryBot.create(:item, title: 'Vintage Clothes2', link: 'http://vintageclothes2.com')
      @item6 = FactoryBot.create(:item, title: 'Local Bob', picture: nil, link: 'http://localbob.com')
      @item7 = FactoryBot.create(:item, title: 'Local Rob', link: 'http://localrob.com')
      @item8 = FactoryBot.create(:item, title: 'Local Hummus', link: 'http://localhummus.com', featured: true)
      @item9 = FactoryBot.create(:item, title: 'Nobu', link: 'http://nobu.com', active: false )
      @item10 = FactoryBot.create(:item, title: 'Katsuya', link: 'http://katsuya.com', active: false )
    end

  end
end