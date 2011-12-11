require 'spec_helper'

describe "items/show.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "Title",
      :desc => "MyText",
      :done => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
