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

    should "make sure you can't create a category with a duplicate name" do
      @badcat = FactoryBot.build(:category, name: 'Clothing')
      deny @badcat.valid?
    end

    should "show that a category that has no subcats can be destroyed" do
      new_cat = FactoryBot.create(:category, name: "NewCat")
      new_cat.reload
      assert_equal "NewCat", new_cat.name
      new_cat.destroy
      assert new_cat.destroyed?
    end

    should "make sure an improperly destroyed category is made inactive" do
      create_subcats
      create_items
      create_subcat_items
      assert @cat1.active
      deny @cat1.subcats.empty?
      deny @cat1.destroy
      @cat1.reload
      deny @cat1.active
      deny @cat1.subcats.empty?
      destroy_subcat_items
      destroy_items
      destroy_subcats
    end

  end

end
