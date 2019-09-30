require 'test_helper'

class SubcatItemTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:subcat)
  should belong_to(:item)
  
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

  end

end
