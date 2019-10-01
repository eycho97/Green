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

  end

end
