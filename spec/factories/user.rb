FactoryGirl.define do
# ["id", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip", "name", "created_at", "updated_at", "uploaded_file_file_name", "uploaded_file_content_type", "uploaded_file_file_size", "uploaded_file_updated_at"] 
  factory :user, class: User do
  	email { Faker::Internet.email }
    #encrypted_password { }
    #reset_password_token
    password { password = Faker::Internet.password(8) }
    password_confirmation { password }
    sign_in_count 0 
    name { Faker::Name.first_name }
  end
end
