ActiveAdmin.register User do
  config.sort_order = 'id_asc'

  scope :joined, :default => true do |users|
    users.includes [:profile]
  end

  index do
    selectable_column
    column :id, :sortable => :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column :email
    column :first_name, :sortable => :'profiles.first_name' do |user|
      user.profile.first_name
    end
    column :last_name, :sortable => :'profiles.last_name' do |user|
      user.profile.last_name
    end
    column :created_at
    column :updated_at
    column :roles do |user|
      user.roles.map{ |r| r.name }.join('<br> ').html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs "User Info" do
      f.input :email
      f.input :roles, :as => :check_boxes do
        Role.all do |r|
          f.checkbox r, {:checked => user.roles.include?(r)}
        end
      end
    end
    f.inputs "Profile", :for => [:profile, f.object.profile || Profile.new] do |p|
      p.input :first_name
      p.input :last_name
      p.input :birth, :as => :datepicker
    end

    f.buttons
  end

end
