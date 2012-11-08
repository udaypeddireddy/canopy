class StatusReport < ActiveRecord::Base
  attr_accessible :client, :consultant_name, :consultant_source, :date, :source_requirement, :status, :technology, :vendor, :vendor_email, :vendor_poc, :vendor_tel
belongs_to :user


end
