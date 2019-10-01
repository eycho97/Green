require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:subcat_items)
  should have_many(:subcats).through(:subcat_items)
  should have_many(:starred_items)
  should have_many(:users).through(:starred_items)

  # test validations
  should validate_presence_of(:title)
  should validate_presence_of(:link)
  should validate_uniqueness_of(:title)
  should validate_uniqueness_of(:link)

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

    # # test the scope active
    # should "show that the scope active works" do
    #   assert_equal 8, Item.active.all.count
    # end

    # # test the scope inactive
    # should "show that the scope inactive works" do
    #   assert_equal ['Katsuya', 'Nobu'], Item.inactive.all.map(&:title).sort
    # end

    # test the scope alphabetical
    should "have a scope to list the items in alphabetical order of title" do
      assert_equal ['Clothes Green', 'Green Clothes', 'Katsuya', 'Local Bob', 'Local Hummus', 'Local Rob', 'Nobu', 'Ny Vintage', 'Vintage Clothes', 'Vintage Clothes2'], Item.alphabetical.all.map(&:title)
    end

    # test the scope featured
    should "have a scope to list the items that are featured" do
      assert_equal ['Local Hummus', 'Vintage Clothes'], Item.featured.all.map(&:title).sort
    end

    # test the scope needs pic
    should "have a scope to list the items that don't have a picture" do
      assert_equal ['Local Bob', 'Vintage Clothes'], Item.needs_pic.all.map(&:title).sort
    end

  end

end
