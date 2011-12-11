require 'spec_helper'



describe ItemsController do
  render_views

  describe "POST 'create'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do
      before(:each) do
        @attr = { :title => "" }
      end

      it "should not create an item" do
        lambda do
          post :create, :item => @attr
        end.should_not change(Item, :count)
      end

      it "should render the home page" do
        post :create, :item => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do
      it "should create an item" do
        lambda do
          post :create, :item => @attr
        end.should change(Item, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :item => @attr
        response.shoudl redirect_to(root_path)
      end
      
      it "should have a flash message" do
        post :create, :item => @attr
        flash[:success].should =~ /item create/i
      end
    end
  end

  describe 'access control' do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
end
