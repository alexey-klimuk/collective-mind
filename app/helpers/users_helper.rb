module UsersHelper
  def my_account?(user)
    return false if !user_signed_in?
    return false if user.nil?
    return true if user.id == current_user.id
    false
  end
end
