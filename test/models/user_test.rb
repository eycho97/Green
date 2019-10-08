require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:starred_items)
  should have_many(:items).through(:starred_items)

  # test validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email).case_insensitive
  should validate_presence_of(:username)
  should validate_uniqueness_of(:username).case_insensitive
  should validate_inclusion_of(:role).in_array(%w[admin manager customer])

  # Validating email... #From PATS
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)

  context "Creating Contexts" do 
    setup do
      create_customers
      create_employees
    end
    
    teardown do
      destroy_customers
      destroy_employees
    end

    # test the scope active
    should "show that the scope active works" do
      assert_equal 6, User.active.all.count
    end

    # test the scope inactive
    should "show that the scope inactive works" do
      assert_equal ['Darian', 'Tim'], User.inactive.all.map(&:first_name).sort
    end

    # test the scope alphabetical
    should "have a scope to list the user in alphabetical order of last name, first name" do
      assert_equal ['Tim', 'Darian', 'Iman', 'Mike', 'Alec', 'Matt', 'Israel', 'Bob'], User.alphabetical.all.map(&:first_name)
    end

    # test the method name
    should "show that name method works" do
      assert_equal "Park, Bob", @bob.name
      assert_equal "Fard, Iman", @iman.name
    end

    # test the method proper name
    should "show that proper_name method works" do
      assert_equal "Bob Park", @bob.proper_name
      assert_equal "Iman Fard", @iman.proper_name
    end

    should "show the number of times a user saved an item" do
      create_categories
      create_subcats
      create_items
      create_starred_items
      assert_equal 3, @bob.number_of_starred_items
      destroy_starred_items
      destroy_items
      destroy_subcats
      destroy_categories
    end

    should "require a password for new users" do
      @baduser = FactoryBot.build(:user, first_name: 'Bad', last_name: 'User', email: 'baduser@gmail.com', username: 'baduser', password: nil)
      deny @baduser.valid?
    end

    should "require passwords to be confirmed and matching" do
      @baduser1 = FactoryBot.build(:user, first_name: 'Bad', last_name: 'User1', email: 'baduser1@gmail.com', username: 'baduser1', password: "secret", password_confirmation: nil)
      deny @baduser1.valid?
      @baduser2 = FactoryBot.build(:user, first_name: 'Bad', last_name: 'User2', email: 'baduser2@gmail.com', username: 'baduser2', password: "secret", password_confirmation: "sauce")
      deny @baduser2.valid?
    end

    should "require passwords to be at least four characters" do
      @baduser = FactoryBot.build(:user, first_name: 'Bad', last_name: 'User', email: 'baduser@gmail.com', username: 'baduser', password: "no", password_confirmation: "no")
      deny @baduser.valid?
    end


  end

end
