require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:subcats)
  
  context "Creating Contexts" do 
    setup do
      create_categories
    end
    
    teardown do
      destroy_categories
    end

  end

end
