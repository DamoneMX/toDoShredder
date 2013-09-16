module SessionsHelper
  def sign_in(user)
    cookies.permanent[:email] = user.email
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_email(cookies[:email])  #simialar to a ternary operator, if (user = nill) user.find by ; else do nothing;
    #calls the find_by method the first time current_user is called, but on subsequent invocations returns @current_user without hitting the database
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def signed_in_user
    unless signed_in?
      #store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:email)
  end
  
  def current_user?(user)
    user == current_user
  end

end
