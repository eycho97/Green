require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:subcat_items)
  should have_many(:subcats).through(:subcat_items)
  should have_many(:starred_items)
  should have_many(:users).through(:starred_items)

  context "Creating Contexts" do 
    setup do
      create_categories
      create_subcats
      create_items
    end
    
    teardown do
      destroy_items
      destroy_subcats
      destroy_categories
    end

  end

end
