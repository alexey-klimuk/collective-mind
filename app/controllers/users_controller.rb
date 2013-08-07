class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_user, only: [:show, :edit, :update]

  authorize_resource class: 'User'

  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show

  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), flash: { success: t('crud.update.success') }
    else
      flash.now[:error] = t('crud.update.fail')
      render :edit
    end
  end

  private
     # Use callbacks to share common setup or constraints between actions.
     def set_user
       @user = User.where(id: params[:id]).first
     end

       # Never trust parameters from the scary internet, only allow the white list through.
     def user_params
       params.require(:user).permit( :email, profile_attributes: [:first_name, :last_name, :birth])
     end

end
