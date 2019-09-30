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

  end

end
