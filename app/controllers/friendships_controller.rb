class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  authorize_resource class: 'Friendship'

  def create
    @friendship = current_user.friendships.create!(friend_id: params[:friend_id])
    if @friendship
      redirect_to dest_path, flash: { success: t('crud.create.success') }
    else
      redirect_to dest_path, flash: { success: t('crud.create.fail') }
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.destroy
      redirect_to dest_path, flash: { success: t('crud.delete.success') }
    else
      redirect_to dest_path, flash: { success: t('crud.delete.fail') }
    end
  end

  def update
    @friendship = current_user.friendships.find(params[:id])
    @friendship.confirmed_at = Time.now
    if @friendship.save
      redirect_to dest_path, flash: { success: t('crud.update.success') }
    else
      redirect_to dest_path, flash: { success: t('crud.update.fail') }
    end
  end

  private

    def dest_path
      :back
    end

end
