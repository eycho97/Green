module Populator
  module SubcatItems

    def create_subcat_items
      @si1 = FactoryBot.create(:subcat_item, subcat: @subcat1, item: @item2)
      @si2 = FactoryBot.create(:subcat_item, subcat: @subcat1, item: @item3)
      @si3 = FactoryBot.create(:subcat_item, subcat: @subcat1, item: @item4)
      @si4 = FactoryBot.create(:subcat_item, subcat: @subcat1, item: @item5)
      @si5 = FactoryBot.create(:subcat_item, subcat: @subcat3, item: @item2)
      @si6 = FactoryBot.create(:subcat_item, subcat: @subcat4, item: @item7)
      @si7 = FactoryBot.create(:subcat_item, subcat: @subcat6, item: @item8)

    end

    def destroy_subcat_items
      @si1.delete
      @si2.delete
      @si3.delete
      @si4.delete
      @si5.delete
      @si6.delete
      @si7.delete
    end

  end
end