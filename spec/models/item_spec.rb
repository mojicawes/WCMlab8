require 'spec_helper'

describe Item do
  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "value for title"
              :body  => "value for body"
              :done  => "true" }
  end
  
  describe "validations" do
    it "should require a user id" do
      Item.new(@attr)should_not be_valid
    end
    
    it "should require nonblank title" do
      @user.items.build(:title => "  ").should_not be_valid
    end
    
    it "should require nonblank body" do
      @user.items.build(:body => "  ").should_not be_valid
    end
  end
  
   it "should create a new instance given valid attributes" do
     @user.items.create!(@attr)
   end
   
   describe "user associations" do
     
     before(:each) do
       @items = @user.items.create(@attr)
     end
     
     it "should have a user attribute" do
       @user.should respond_to(:user)
     end
     
     it "should have the right associated user" do
       @item.user_id.should == @user.id
       @items.user.should == @user
     end
   end
end
