module Contexts
  module StarredItemContexts

    def create_starred_items
      @st1 = FactoryBot.create(:starred_item, user: @bob, item: @item2)
      @st2 = FactoryBot.create(:starred_item, user: @bob, item: @item4)
      @st3 = FactoryBot.create(:starred_item, user: @bob, item: @item6)
      @st4 = FactoryBot.create(:starred_item, user: @mike, item: @item3)
      @st5 = FactoryBot.create(:starred_item, user: @mike, item: @item5)
      @st6 = FactoryBot.create(:starred_item, user: @mike, item: @item7)
      @st7 = FactoryBot.create(:starred_item, user: @israel, item: @item8)
      @st8 = FactoryBot.create(:starred_item, user: @israel, item: @item9)
    end

    def delete_starred_items
      @st1.delete
      @st2.delete
      @st3.delete
      @st4.delete
      @st5.delete
      @st6.delete
      @st7.delete
      @st8.delete
    end

  end
end