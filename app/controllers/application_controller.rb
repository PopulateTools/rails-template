class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsManagement


  before_action :set_locale
  helper_method :current_user, :logged_in?, :current_user?, :login_path

  rescue_from OAuth::Unauthorized, with: :external_service_unauthorized

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  protected

  def external_service_unauthorized
    flash[:error] = t('.unauthorized')
    redirect_to root_path
  end

end
