FactoryBot.define do

  factory :category do
    name "Clothing"
    active true
  end

  factory :subcat do
    association :category
    name "Vintage"
    active true
  end

  factory :item do
    title "Ny Vintage"
    blurb "Vintage store in lower east Manhattan"
    description "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    picture "picture"
    link "www.nyvintage.com"
    featured false
    active true
  end

  factory :user do
    first_name "Ed"
    last_name "Cho"
    email "edcho@gmail.com"
    username "edcho"
    password "secret"
    password_confirmation "secret"
    role "customer"
    active true
  end

  factory :subcat_item do
    association :subcat
    association :item
  end

  factory :starred_item do
    association :user
    association :item
  end

end