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
    should "have a scope to list the saved items for a given item" do
      assert_equal [@si1, @si5], SubcatItem.for_item(@item2).all.sort
    end

    # test the scope for user
    should "have a scope to list the saved items for a given subcat" do
      assert_equal [@si1, @si2, @si3, @si4], SubcatItem.for_subcat(@subcat1).all.sort
    end

  end

end
