# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    user_id nil
    uploaded_file_file_name "Screen_Shot_2013-06-23_at_00.23.07.png"
    uploaded_file_content_type "image/png"
    uploaded_file_file_size 61172
    uploaded_file_updated_at 'Fri, 27 Jun 2014 21:16:08 UTC +00:00'
    folder_id nil
    parent_id nil 
   end
end
