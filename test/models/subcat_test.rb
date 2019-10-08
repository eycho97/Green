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

    # test custom validation category is active in the system
    should "only allow subcats created when the category is active and in the system" do
      @badsub1 = FactoryBot.build(:subcat, category: @cat5, name: 'Badsub1')
      deny @badsub1.valid?
      @badcat = FactoryBot.build(:category, name: 'Badcat')
      @badsub2 = FactoryBot.build(:subcat, category: @badcat, name: 'Badsub2')
      deny @badsub2.valid?
    end

    should "show that a subcat that has no items can be destroyed" do
      new_subcat = FactoryBot.create(:subcat, category: @cat4, name: "NewSubcat")
      new_subcat.reload
      assert_equal "NewSubcat", new_subcat.name
      new_subcat.destroy
      assert new_subcat.destroyed?
    end

    # should "make sure an improperly destroyed subcat is made inactive" do
    #   create_items
    #   create_subcat_items
    #   assert @subcat1.active
    #   deny @subcat1.subcat_items.empty?
    #   @subcat1.destroy
    #   @subcat1.reload
    #   # verify the subcat is now inactive
    #   deny @subcat1.active
    #   # ... and that the subcat items are still there
    #   deny @subcat1.subcat_items.empty?
    #   destroy_subcat_items
    #   destroy_items
    # end

  end

end
