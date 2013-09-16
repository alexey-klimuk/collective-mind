# Use this hook to configure impressionist parameters
Impressionist.setup do |config|
  # Define ORM. Could be :active_record (default), :mongo_mapper or :mongoid
  config.orm = :active_record
end

class Impression < ActiveRecord::Base
  attr_accessible :impressionable_type, :impressionable_id, :controller_name, :action_name, :user_id,
                  :request_hash, :session_hash, :ip_address, :referrer
end



