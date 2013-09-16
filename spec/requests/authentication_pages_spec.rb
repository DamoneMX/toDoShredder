require 'spec_helper'

describe "RegistrationAndLoginProcess" do

  subject { page }

  describe "signup page" do
    #before { visit signup_path }

    before { visit signup_path }
    #it  "should show the user that it's a registration page" do
      #visit signup_path #replaced by before
      #page.should have_selector('h1', :text => "Register for To-do shredder") #became it
    #end
    it { should have_selector('h1', text: "Register for To-do shredder" ) }
    describe "with invalid information" do
      before { click_button "Create my account" }
      it { should have_selector('h2.error_notice', text: 'Errors prohibited this user from being saved:') }
      it "should not create a user" do
        expect { click_button "Create my account" }.not_to change(User, :count)
      end
    end
    
    describe "make submission with valid information generates a new user" do
      before do
        fill_in "user_firstName",    with: "Michael"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
      end

      it "should create a user" do
        expect { click_button "Create my account" }.to change(User, :count).by(1)
      end
    end
  end
  
  describe "Log In page" do
     before { visit signin_path }

    it { should have_selector('h1',    text: 'To-Do Shredder') }
    describe "with invalid information" do
      before { click_button "Sign in" }
      it { should have_selector('#notice', text: 'Invalid email/password combination') }
    end
    
    describe "with valid user" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
        
        it { should have_selector('h1', text: "Pending Tasks") }
        
        describe "followed by signout" do
          before { click_link "Sign Out" }
          it { should have_button('Sign in') }
        end
    end
    
  end
  
end
