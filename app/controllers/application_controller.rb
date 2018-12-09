class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('app/javascript')

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
      { lang: I18n.locale }
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_locale
    I18n.locale = params[:lang] || I18n.default_locale
  end

end
