class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :birth, :user

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :user_id

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.error_message(attribute, default_message = nil)
    error_hash = { :email => "Email can't be blank and must be a valid email address.", # email, password, passw conf do not override devise defaults
                   :password => "Password must be between 6 and 20 characters long.",
                   :password_confirmation => "Password confirmation must match exactly.",
                   :first_name => "First name can't be blank.",
                   :last_name => "Last name can't be blank."
                }

    error_hash[attribute] || default_message
  end

end
