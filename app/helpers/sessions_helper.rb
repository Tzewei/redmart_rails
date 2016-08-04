module SessionsHelper

  # Set session with authenticated user
    def log_in(user)
      session[:user_id] = user.id
    end

    # Returns the user corresponding to the remember token cookie.
 def current_user
   if (user_id = session[:user_id]) #note this is not a comparision, it's setting user_id whilst checking if session[:user_id is blank]
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id]) #note this is not a comparision, it's setting user_id whilst checking if session[:user_id is blank]
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
 end

  # check if passed user is current_user
  def current_user?(user)
    user == current_user
  end

  # check if current user is nil
  def logged_in?
    current_user
  end

# Logs out session the current user.
  def log_out
    session.delete(:user_id) #delete part of the session
    @current_user = nil #set current_user to empty again
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
