require 'rails_helper'

RSpec.describe "folders/new", :type => :view do
  pending

  before(:each) do
    assign(:folder, Folder.new(
      :name => "MyString",
      :parent_id => 1,
      :user_id => 1
    ))
  end

  it "renders new folder form" do
    render

    assert_select "form[action=?][method=?]", folders_path, "post" do

      assert_select "input#folder_name[name=?]", "folder[name]"

      assert_select "input#folder_parent_id[name=?]", "folder[parent_id]"

      assert_select "input#folder_user_id[name=?]", "folder[user_id]"
    end
  end
end
