require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "MyString",
      :notes => "MyString",
      :status => false
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "input#task_notes[name=?]", "task[notes]"
      assert_select "input#task_status[name=?]", "task[status]"
    end
  end
end
