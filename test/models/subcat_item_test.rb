require 'test_helper'

class SubcatItemTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:subcat)
  should belong_to(:item)
  
  # test validations
  should validate_presence_of(:subcat_id)
  should validate_presence_of(:item_id)

  context "Creating Contexts" do 
    setup do
      create_categories
      create_subcats
      create_items
      create_subcat_items
    end
    
    teardown do
      destroy_subcat_items
      destroy_items
      destroy_subcats
      destroy_categories
    end

    # test the scope for item
    should "have a scope to list the subcat items for a given item" do
      assert_equal [@si1, @si5], SubcatItem.for_item(@item2).all.sort
    end

    # test the scope for subcat
    should "have a scope to list the subcat items for a given subcat" do
      assert_equal [@si1, @si2, @si3, @si4], SubcatItem.for_subcat(@subcat1).all.sort
    end


    # test custom validation subcat is active in the system
    should "only allow subcat items to be created when the subcat is active and in the system" do
      @badsi1 = FactoryBot.build(:subcat_item, subcat: @subcat10, item: @item2)
      deny @badsi1.valid?
      @badsubcat = FactoryBot.build(:subcat, category: @cat6, name: 'Bad')
      @badsi2 = FactoryBot.build(:subcat_item, subcat: @badsubcat, item: @item2)
      deny @badsi2.valid?
    end

    # test custom validation item is active in the system
    should "only allow subcat items to be created when the item is active and in the system" do
      @badsi1 = FactoryBot.build(:subcat_item, subcat: @subcat5, item: @item10)
      deny @badsi1.valid?
      @baditem = FactoryBot.build(:item, title: 'baditem', link: 'baditem.com')
      @badsi2 = FactoryBot.build(:subcat_item, subcat: @subcat5, item: @baditem)
      deny @badsi2.valid?
    end

  end

end
