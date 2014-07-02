require 'rails_helper'

RSpec.describe "folders/show", :type => :view do
  pending
  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :name => "Name",
      :parent_id => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
