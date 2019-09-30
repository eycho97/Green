require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:starred_items)
  should have_many(:items).through(:starred_items)
  
  context "Creating Contexts" do 
    setup do
      create_users
    end
    
    teardown do
      destroy_users
    end

  end

end
