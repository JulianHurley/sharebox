require 'rails_helper'

RSpec.describe "folders/edit", :type => :view do
  pending

  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :name => "MyString",
      :parent_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit folder form" do
    render

    assert_select "form[action=?][method=?]", folder_path(@folder), "post" do

      assert_select "input#folder_name[name=?]", "folder[name]"

      assert_select "input#folder_parent_id[name=?]", "folder[parent_id]"

      assert_select "input#folder_user_id[name=?]", "folder[user_id]"
    end
  end
end
