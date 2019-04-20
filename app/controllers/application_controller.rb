class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :store_user_location!, if: :storable_location?


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { :locale => ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end

  private
  # Its important that the location is NOT stored if:
  # - The request method is not GET (non idempotent)
  # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
  #    infinite redirect loop.
  # - The request is an Ajax request as this can lead to very unexpected behaviour.
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end