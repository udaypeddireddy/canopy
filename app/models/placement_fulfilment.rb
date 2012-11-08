class PlacementFulfilment < ActiveRecord::Base
  attr_accessible :client_id, :consultant_id,:consultant_type, :recruiter_id, :salesperson_id, :user_acceptance, :user_acceptance_timestamp, :vendor_id, :rate_code,:subvendor_id
belongs_to :client
belongs_to :vendor
belongs_to :user
end
