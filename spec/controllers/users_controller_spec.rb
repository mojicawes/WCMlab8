require 'spec_helper'

describe UsersController do
  render_views

  describe "failure" do
    before(:each) do
      @attr = { :name => "", :email => "", :password => "",
                :password_confirmation => ""
      }
    end
    
    it "should not create a user" do
      lambda do
        post :create, :user => @attr
      end.should_not change(User, :count)
    end
    
    it "should have the right title" do
      post :create, :user => @attr
      response.should have_selector("title", :content => "Sign up")
    end
    
    it "should render the 'new' page" do
      post :create, :user => @attr
      response.should render_template('new')
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign up")
    end

    it "returns http success" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign up")
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = User.create!(:name  => "John Doe",
      :email => "jdoe@cs.utsa.edu",
      :password => "john1")
    end

    it "it should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    it "should have the right title" do
      get 'show', :id => @user.id
      response.should have_selector("title", :content => @user.name)
    end
  end

  describe "POST 'create'" do
    describe "success" do

      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end
      before(:each) do
        @attr = {:name     => "John Doe",
                 :email    => "jdoe@cs.utsa.edu",
                 :password => "john1"}
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome to the sample app/i
      end
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Current users")
    end
  end

end
