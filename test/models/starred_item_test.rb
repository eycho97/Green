require 'test_helper'

class StarredItemTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:user)
  should belong_to(:item)

  context "Creating Contexts" do 
    setup do
      create_items
      create_customers
      create_starred_items
    end
    
    teardown do
      destroy_starred_items
      destroy_customers
      destroy_items
    end

    # test the scope for item
    should "have a scope to list the saved items for a given item" do
      assert_equal [@st1, @st4], StarredItem.for_item(@item2).all.sort
    end

    # test the scope for user
    should "have a scope to list the saved items for a given user" do
      assert_equal [@st1, @st2, @st3], StarredItem.for_user(@bob).all.sort
    end

    # test custom validation item is not already starred
    should "not allow a user to save an item twice" do 
      @badsi = FactoryBot.build(:starred_item, user: @bob, item: @item2)
      deny @badsi.valid?
    end

    # test custom validation user is active in the system
    should "only allow saved items to be created when the user is active and in the system" do
      @badsi1 = FactoryBot.build(:starred_item, user: @tim, item: @item2)
      deny @badsi1.valid?
      @baduser = FactoryBot.build(:user, first_name: 'bad', last_name: 'user', email: 'baduser@gmail.com')
      @badsi2 = FactoryBot.build(:starred_item, user: @baduser, item: @item2)
      deny @badsi2.valid?
    end

    # test custom validation item is active in the system
    should "only allow saved items to be created when the item is active and in the system" do
      @badsi1 = FactoryBot.build(:starred_item, user: @bob, item: @item10)
      deny @badsi1.valid?
      @baditem = FactoryBot.build(:item, title: 'baditem', link: 'baditem.com')
      @badsi2 = FactoryBot.build(:starred_item, user: @bob, item: @baditem)
      deny @badsi2.valid?
    end

  end

end
