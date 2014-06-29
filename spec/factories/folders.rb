FactoryGirl.define do
  factory :folder, class: Folder do
    name { Faker::Lorem.word }
    parent_id nil
    user_id nil
  end
end
