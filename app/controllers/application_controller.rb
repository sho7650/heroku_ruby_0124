class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic('Application') do |username, password|
      creds = Rails.application.credentials.basic_auth || {}
      ActiveSupport::SecurityUtils.secure_compare(username.to_s, creds[:username].to_s) &
        ActiveSupport::SecurityUtils.secure_compare(password.to_s, creds[:password].to_s)
    end
  end
end
