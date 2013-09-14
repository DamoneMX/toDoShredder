class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      sign_in user
      beginningTime = Time.new(Time.now.year, Time.now.month, Time.now.day, 0, 0, 0)
      endTime = Time.new(Time.now.year, Time.now.month, Time.now.day, 23, 59, 59)
      if user.loginTime <= beginningTime || user.loginTime >= endTime
        user.loginTime = Time.now
        user.save
      end
      redirect_to "/tasks" #currently redirects to user, should redirect to tasks
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
