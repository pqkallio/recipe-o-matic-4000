FactoryGirl.define do
  factory :user do
    username "johnny"
    password "J3baR0n1"
    password_confirmation "J3baR0n1"
  end

  factory :user_wo_password, class: User do
    username "johnny"
  end

  factory :unit do
    name "pcs"
  end

  factory :unit2, class: Unit do
    name "ltrs"
  end

  factory :unit3, class: Unit do
    name "sacks"
  end

  factory :material, class: Material do
    name "banana"
  end

  factory :material2, class: Material do
    name "flour"
  end

  factory :material3, class: Material do
    name "salt"
  end

  factory :recipe do
    name "Pie"
    description "ABC"
    instructions "DEF"
    cooking "HIJ"
    portions 1
    user
  end

  factory :ingredient do
    material
    amount 0.2
    unit
    recipe
  end

end