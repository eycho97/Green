require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "verify the abilities of admin users to do everything" do
      create_admin_abilities
      assert @admin_ability.can? :manage, :all
      delete_admin_abilities
    end

    should "verify the abilities of managers" do
      create_manager_abilities
      # no global privileges
      deny @alec_ability.can? :manage, :all
      # testing particular abilities
      assert @alec_ability.can? :manage, Category
      assert @alec_ability.can? :manage, Subcat
      assert @alec_ability.can? :manage, Item
      assert @alec_ability.can? :manage, SubcatItem
      assert @alec_ability.can? :show, @alec
      assert @alec_ability.can? :update, @alec
      assert @alec_ability.can? :show, @bob
      deny @alec_ability.can? :update, @bob
      delete_manager_abilities
    end

    should "verify the abilities of customers" do
      create_customer_abilities
      # no global privileges
      deny @bob_ability.can? :manage, :all
      # testing particular abilities
      assert @bob_ability.can? :show, @bob
      assert @bob_ability.can? :index, Item
      assert @bob_ability.can? :index, StarredItem
      deny @bob_ability.can? :show, @alec
      assert @bob_ability.can? :show, @item1
      delete_customer_abilities
    end

    should "verify the abilities of guest users" do
      create_guest_abilities
      deny @guest_ability.can? :manage, :all
      assert @guest_ability.can? :read, Item
      delete_guest_abilities
    end
  end
end