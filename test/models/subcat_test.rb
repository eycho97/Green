require 'test_helper'

class SubcatTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:category)
  should have_many(:subcat_items)
  should have_many(:items).through(:subcat_items)

  # test validations
  should validate_presence_of(:category_id)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  context "Creating Contexts" do 
    setup do
      create_categories
      create_subcats
    end
    
    teardown do
      destroy_subcats
      destroy_categories
    end

    #test the scope active
    should "show that the scope active works" do
      assert_equal 9, Subcat.active.all.count
    end

    #test the scope inactive
    should "show that the scope inactive works" do
      assert_equal ['Hotels', 'News'], Subcat.inactive.all.map(&:name).sort
    end

    # test the scope 'alphabetical'
    should "have a scope to list the subcats in alphabetical order of name" do
      assert_equal ['Casual', 'Cheap Eats', 'Energy', 'Fancy', 'Green Grocery', 'Hotels', 'Local Farmers', 'News', 'Second Hand', 'Vintage', 'Waste'], Subcat.alphabetical.all.map(&:name)
    end

    # test the scope 'for_category'
    should "have a scope to list the subcats for a given category" do
      assert_equal ['Casual', 'Cheap Eats', 'Fancy'], Subcat.for_category(@cat2).map(&:name).sort
    end

  end

end
