class ApplicationController < ActionController::Base
  impersonates :user
  include Pundit::Authorization
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[username name email password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role?(:superadmin) || current_user.has_role?(:admin)
      admin_root_path
    elsif current_user
      members_path
    end
  end

  def authenticate_inviter!
    unless current_user.has_role?(:admin)
      redirect_to root_url, alert: "Access Denied"
    end
    super
  end
end
