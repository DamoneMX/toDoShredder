class TasksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  
  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = Task.all
    @user = current_user
    @tasks = @user.tasks
    @displayShredder = true
    
    @hours = (Time.now - @user.loginTime)
    #if @hours > 2

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
      format.xml { render xml: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  # GET /tasks/new.xml
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
      format.xml  { render xml: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  # POST /tasks.xml
  def create
    @task = current_user.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
        format.xml { render xml: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.xml  { render xml:  @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.xml  { render xml: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  # DELETE /tasks/1.xml
  def destroy
    @deletedId = params[:id]
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.js   { }
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end
  
  # GET /tasks/1/active
  def active
    @tasks = Task.find_all_by_status(true)
    
    #render '_active'    
    respond_to do |format|
      format.html { render '_active'    }
      format.js
    end
  end
  
end
