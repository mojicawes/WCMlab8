require 'spec_helper'


describe Item do
  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "value for title",
      :desc => "value for desc",
      :done => "false"
    }
  end

  it "should create a new instance given valid attributes" do
    @user.items.create!(@attr)
  end

  describe "user associations" do
    before(:each) do
      @items = @user.items.create(@attr)
    end

    it "should have a user attribute" do
      @items.should respond_to(:user)
    end

    it "should have the right associated user" do
      @user.user_id.should == @user.id
      @user.user.should == @user
    end
  end
end
