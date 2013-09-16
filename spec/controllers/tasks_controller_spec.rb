require 'spec_helper'
include SessionsHelper

describe TasksController do

  let(:valid_attributes) { { "name" => "MyString" } }

  before :each do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect { post :create, {:task => valid_attributes} }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => valid_attributes}
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => valid_attributes}
        response.should redirect_to(Task.last)
      end
    end
       
    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => { "name" => "invalid value" }}
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => { "name" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end
  
  describe "DELETE destroy" do
    it "destroys the requested task and should not redirect to taks list" do #should not becuase it is an AJAX method
      task = Task.create! valid_attributes
      expect {
        delete :destroy, {:id => task.to_param}
      }.to change(Task, :count).by(-1)
      response.should_not redirect_to(tasks_url)
    end
  end

  describe "GET show" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :show, {:id => task.to_param}
      assigns(:task).should eq(task)
    end
  end


  describe "GET new" do
    it "assigns a new task as @task" do
      get :new, {}
      assigns(:task).should be_a_new(Task)
    end
  end
  
  context "XML" do
    describe "consulting taks via GET XML"
      it "should return successful response" do
        task = Task.create! valid_attributes
        request.accept = "text/xml"
        get :show, {:id => task.to_param}
        response.should be_success
      end
    end
  end

