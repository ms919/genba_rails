class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
    set_locale
  end

  def set_locale
    I18n.locale = current_user&.locale || :ja
    Time.zone = I18n.translate("timezone") || "Asia/Tokyo"
  end

end
