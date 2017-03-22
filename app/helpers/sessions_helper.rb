module SessionsHelper
 
  # sign in (remember token)
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  # returns true if user is signed in 
  def signed_in?
    !current_user.nil?
  end

  # force user to sign in remember url accessed 
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  # redirect to root_url unless user is current user 
  def correct_user
    @user = User.find(current_user)
    redirect_to(root_url) unless current_user?(@user)
  end
  
  # set current user 
  def current_user=(user)
    @current_user = user
  end

  # get current user 
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # verify that user is current user 
  def current_user?(user)
    user == current_user
  end

  # sign out (forget token)
  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # redirect to stored url or default specified 
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  # for controller level access restriction 
  def not_admin_user
    if current_user.nil? || current_user.user_role.name != 'admin'
      redirect_to root_url
    end
  end

  def guest_user
    if current_user.nil? || current_user.user_role.name == 'guest'
      redirect_to root_url
    end
  end

  def normal_user
    if current_user.user_role.name == 'normal'
      redirect_to root_url
    end
  end
  
end