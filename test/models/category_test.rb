require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:subcats)

  # test validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive
  
  context "Creating Contexts" do 
    setup do
      create_categories
    end
    
    teardown do
      destroy_categories
    end

    #test the scope active
    should "show that the scope active works" do
      assert_equal 4, Category.active.all.count
    end

    #test the scope inactive
    should "show that the scope inactive works" do
      assert_equal ['Home Goods'], Category.inactive.all.map(&:name).sort
    end

    # test the scope 'alphabetical'
    should "have a scope to list the categories in alphabetical order of name" do
      assert_equal ['Clothing', 'Energy', 'Food', 'Home Goods', 'Restaurants'], Category.alphabetical.all.map(&:name)
    end

  end

end
