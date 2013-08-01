module ActiveAdmin
  class BaseController < ::InheritedResources::Base
    module Authorization

      protected

      def rescue_active_admin_access_denied(exception)
        error_message = exception.message

        respond_to do |format|
          format.html do
            flash[:error] = error_message

            if request.headers["HTTP_REFERER"].present?
              redirect_to :back
            else
              controller, action = active_admin_namespace.root_to.split("#")
              redirect_to :controller => controller, :action => action
            end
          end

          format.csv { render :text => error_message, :status => :unauthorized}
          format.json { render :json => { :error => error_message }, :status => :unauthorized}
          format.xml { render :xml => "<error>#{error_message}</error>", :status => :unauthorized}
        end
      end
    end
  end
end
