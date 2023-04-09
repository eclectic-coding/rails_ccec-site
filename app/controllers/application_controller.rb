class ApplicationController < ActionController::Base
  impersonates :user
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role?(:superadmin) || current_user.has_role?(:admin)
      admin_root_path
    elsif current_user
      root_path
    end
  end

  def authenticate_inviter!
    unless current_user.has_role?(:admin)
      redirect_to root_url, alert: "Access Denied"
    end
    super
  end
end
