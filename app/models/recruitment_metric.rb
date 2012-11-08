class RecruitmentMetric < ActiveRecord::Base
  attr_accessible :placement_success, :user_id
  belongs_to :user
belongs_to :vendor_contact
end
