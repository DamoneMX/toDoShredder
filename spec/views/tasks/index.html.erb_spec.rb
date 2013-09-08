require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :name => "Name",
        :notes => "Notes",
        :status => false
      ),
      stub_model(Task,
        :name => "Name",
        :notes => "Notes",
        :status => false
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
