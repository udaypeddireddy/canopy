class PersonalProfile < ActiveRecord::Base
attr_accessible  :address1, :address2, :city,  :dob, :email, :expiry_date, :firstname, :lastname, :mobile,   :phone_work,  :state, :technology, :user_id, :visa_type,  :zip, :project_id

belongs_to :user

validates  :address1, :address2, :city, :expiry_date, :firstname, :lastname,  :state, :technology,  :visa_type,  :zip, :presence=>'true'

validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
 
validates_numericality_of :phone_work, :mobile, :length => {:minimum => 10, :maximum =>10}
validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"

end
