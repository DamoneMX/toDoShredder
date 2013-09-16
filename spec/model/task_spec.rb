require 'spec_helper'

describe User do
  
=begin
  before do
    #user = User.new(firstName: "Example User", email: "user@example.com", password: "testPass")
    #@task = user.tasks.build(name: "Sample", notes: "Special Reminder")
    @task = Task.new(name: "Sample", notes: "Special Reminder", user_id: 1)
  end 

  subject { @task }

  it { should respond_to(:name) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should_be_valid }
  
  describe "when there is no user associated to task" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end
=end
end