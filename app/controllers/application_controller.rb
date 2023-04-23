class ApplicationController < ActionController::Base
  before_action :require_login

  $current_user = nil

  def set_locale
    I18n.default_locale = I18n.available_locales.select{|e| e == params['id'].to_sym}[0]
    #I18n.with_locale(locale, &action)
    redirect_to request.referrer
    #redirect_to :back
  end

private
  def require_login
    if $current_user.nil?
      flash[:danger] = t('app.login_required')
      redirect_to root_url
    end
  end
end
