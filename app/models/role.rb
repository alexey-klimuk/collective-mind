class Role < ActiveRecord::Base
    
  validates_uniqueness_of :name, :symbol
  validates_presence_of :name, :symbol

  has_many :role_users
  has_many :users, :through => :role_users

  scope :by_symbol, lambda { |symbol| where( 'symbol = ?', symbol.to_s ).limit(1) }

  # Class methods

  # well-known roles
  def self.member
    by_symbol(:member).first
  end

  def self.admin
    by_symbol(:admin).first
  end

  def self.moderator
    by_symbol(:moderator).first
  end

end
