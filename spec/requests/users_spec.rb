require 'spec_helper'



describe "Users" do

  describe "signup" do

    describe "failure" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with => "Example User"
          fill_in "Email", :with => "user@example.com"
          fill_in "Password", :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
          :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User :count).by(1)
      end

      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with => ""
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(:User, :count)
      end
    end
  end

  describe "GET /users" do
    it "should have an index page at '/users'" do
      get users_path
      response.status.should be(200)
      response.should be_success
      response.should have_selector("title", :content => "Current users")
    end

    it "should have the right links on the layout" do
      visit users_path
      click_link "Home"
      response.should have_selector('title', :content => "Home")
    end
  end
end