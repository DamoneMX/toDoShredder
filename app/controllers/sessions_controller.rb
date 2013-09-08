class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      sign_in user
      redirect_to user #currently redirects to user, should redirect to tasks
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
