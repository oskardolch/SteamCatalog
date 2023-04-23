class LoginsController < ApplicationController
  skip_before_action :require_login

  def show
  end

  def create
    user = User.find_by("LOWER(name) = ?", params[:name].downcase)
    if user && user.authenticate(params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      unless user.pref_lang.nil? || user.pref_lang.empty?
        I18n.default_locale = user.pref_lang.to_sym
      end
      $current_user = user
    else
      flash[:danger] = 'Invalid email/password combination'
    end
    redirect_to root_url
  end

  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    $current_user = nil
    redirect_to root_url
  end
end
