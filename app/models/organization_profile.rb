class OrganizationProfile < ActiveRecord::Base

attr_accessible :billing_type, :is_admin, :role, :user_type, :user_id
belongs_to :user
  
end
