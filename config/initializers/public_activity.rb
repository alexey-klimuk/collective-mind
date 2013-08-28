module PublicActivity
  module ORM
    module ActiveRecord
      class Activity < ::ActiveRecord::Base
        attr_accessible :key, :owner, :parameters, :recipient, :trackable
      end
    end
  end
end