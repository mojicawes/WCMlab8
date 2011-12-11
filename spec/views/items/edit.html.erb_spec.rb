require 'spec_helper'

describe "items/edit.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "MyString",
      :desc => "MyText",
      :done => false
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_title", :name => "item[title]"
      assert_select "textarea#item_desc", :name => "item[desc]"
      assert_select "input#item_done", :name => "item[done]"
    end
  end
end
