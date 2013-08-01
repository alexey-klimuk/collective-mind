class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def authenticate_admin_interface!
    redirect_to root_path unless current_user.is_active_admin?
  end

  # Related to I18n
  # ---------------------------------------------------------------------------

  def t_model_name(model=nil)
    @t_m_n ||= I18n.t("activerecord.models.#{((model && model.model_name.underscore) || controller_name.singularize.classify.underscore )}.one", nil)
  end

  def t(key,subs={})
    I18n.t key, ( subs.keys.include?(:model) ? subs : {:model => t_model_name}.merge(subs) )
  end


end
