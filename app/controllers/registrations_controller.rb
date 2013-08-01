class RegistrationsController < Devise::RegistrationsController

  layout 'devise'

  def new
    resource = build_resource({})
    resource.build_profile
    respond_with resource
  end

  def create
    resource = build_resource(params[:user])

    if(resource.save)
      flash.now[:success] = t('devise.registrations.signed_up')
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_up_path_for(resource)
    else
      flash.now[:error] = t('devise.registrations.error')
      render :action => "new"
    end
  end

end
