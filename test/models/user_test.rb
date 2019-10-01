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

  context "Creating Contexts" do 
    setup do
      create_customers
      create_employees
    end
    
    teardown do
      destroy_customers
      destroy_employees
    end

    # # test the scope active
    # should "show that the scope active works" do
    #   assert_equal 6, User.active.all.count
    # end

    # # test the scope inactive
    # should "show that the scope inactive works" do
    #   assert_equal ['Tim'], User.inactive.all.map(&:first_name).sort
    # end

    # test the scope alphabetical
    should "have a scope to list the user in alphabetical order of last name, first name" do
      assert_equal ['Tim', 'Darian', 'Iman', 'Mike', 'Alec', 'Matt', 'Israel', 'Bob'], User.alphabetical.all.map(&:first_name)
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

    should "deny bad email formats" do
      @be1 = FactoryBot.build(:user, first_name: "be", last_name: "be1", email: "bp@1@example.com", username: 'baduser',)
      deny @be1.valid?
      @be2 = FactoryBot.build(:user, first_name: "be", last_name: "be2", email: "bp 2@example.com", username: 'baduser1',)
      deny @be2.valid?
      @be3 = FactoryBot.build(:user, first_name: "be", last_name: "be3", email: "bp2@example.nope", username: 'baduser2',)
      deny @be3.valid?
      @be4 = FactoryBot.build(:user, first_name: "be", last_name: "be4", email: "bp2@exam@ple.nope", username: 'baduser3',)
      deny @be4.valid?
    end
  end

end
