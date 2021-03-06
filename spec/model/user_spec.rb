require 'spec_helper'

describe User do
  
  before { @user = User.new(firstName: "Example User", email: "user@example.com", password: "testPass") }

  subject { @user }

  it { should respond_to(:firstName) }
  it { should respond_to(:email) }
  it { should respond_to(:tasks) }
  
  describe "when First Name or E-mail is not present" do  #Password doesn't have to be set we may be using oAuth
      before { @user.firstName = " " } #executes this prior to checking
      before { @user.email = " " }
      it { should_not be_valid }
  end
  
  #Waiting until implementation of oAuth to reactivate this 
  #describe "when there is a password present and it doesn't match confirmation" do
  #  before { @user.password_confirmation = "mismatch" }
  #  it { should_not be_valid }
  #end
  
  describe "when any value except password is longer than 40 characters long" do
    before { @user.firstName = @user.email = @user.lastName = "a" * 41 }
    it { should_not be_valid }
  end
    
  describe "when E-mail is already registered" do
    before do
      user_with_same_email = @user.clone #for rails > 3.1 use .dup
      user_with_same_email.save
    end

      it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
end