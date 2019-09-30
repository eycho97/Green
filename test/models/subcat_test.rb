require 'test_helper'

class SubcatTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:category)
  should have_many(:subcat_items)
  should have_many(:items).through(:subcat_items)

  context "Creating Contexts" do 
    ssetup do
      create_categories
      create_subcats
    end
    
    teardown do
      destroy_subcats
      destroy_categories
    end

  end

end
