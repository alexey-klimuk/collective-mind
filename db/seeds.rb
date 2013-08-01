#create roles
Role.where(:symbol => 'member', :name => 'Member').first_or_create
Role.where(:symbol => 'moderator', :name => 'Moderator').first_or_create
Role.where(:symbol => 'admin', :name => 'Administrator').first_or_create

# Users
# helper method to seed test users and their profiles
def seed_user( user_params )
  unless User.where(:email => user_params[:email]).first_or_create
    
    user = User.new(:email => user_params[:email], :password => 'password' )
    user.roles << user_params[:role]

    profile = Profile.new()
    profile.user = user
    profile.first_name = user_params[:first_name]
    profile.last_name = user_params[:last_name]
    user.profile = profile

    user.save!
    profile.save!
  end
end

[
 { :email => 'admin@admin.com', :first_name => 'User', :last_name => 'Admin',   :role => Role.admin },
 { :email => 'moderator@moderator.com', :first_name => 'User', :last_name => 'Moderator',   :role => Role.moderator },
 { :email => 'test@member.com', :first_name => 'User', :last_name => 'Member',   :role => Role.member },
].each{ |u| seed_user u }



