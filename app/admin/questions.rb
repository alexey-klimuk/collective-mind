ActiveAdmin.register Question do
  config.sort_order = 'id_asc'

  index do
     selectable_column
     column :id, :sortable => :id do |user|
       link_to user.id, admin_user_path(user)
     end
     column :title
     column :created_at
     column :updated_at
     column :tag_list do |user|
       user.tags.map{ |t| t.name }.join('<br> ').html_safe
     end
     default_actions
   end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
      f.input :active
      f.input :tag_list, :as => :string
    end
    f.buttons

  end
end
