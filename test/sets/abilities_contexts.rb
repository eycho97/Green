module Contexts
  module AbilityContexts
    def create_admin_abilities
      @admin_user = FactoryBot.create(:user, first_name: "Admin", last_name: "Admin", email: "admin@gmail.com", username: "admin", role: "admin")
      @admin_ability = Ability.new(@admin_user)
    end

    def delete_admin_abilities
      @admin_user.delete
    end

    def create_manager_abilities
      create_employees
      @alec_ability = Ability.new(@alec)
      # created related objects for testing
      create_customers
      create_categories
      create_subcats
      create_items
      create_subcat_items
      create_starred_items
    end

    def delete_manager_abilities
      destroy_starred_items
      destroy_subcat_items
      destroy_items
      destroy_subcats
      destroy_categories
      destroy_customers
      destroy_employees
    end

    def create_customer_abilities
      create_customers
      @bob_ability = Ability.new(@bob)
      @mike_ability = Ability.new(@mike)
      
      # created related objects for testing
      create_categories
      create_subcats
      create_items
      create_employees
      create_subcat_items
      create_starred_items
    end

    def delete_customer_abilities
      destroy_starred_items
      destroy_subcat_items
      destroy_employees
      destroy_items
      destroy_subcats
      destroy_categories
      destroy_customers
    end

    def create_guest_abilities
      @guest_user = User.new
      @guest_ability = Ability.new(@guest_user)
    end

    def delete_guest_abilities
      # nothing to delete, b/c nothing saved to db
    end

  end
end