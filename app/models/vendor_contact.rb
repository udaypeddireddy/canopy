class VendorContact < ActiveRecord::Base
attr_accessible :phone, :phone_extension, :poc_alternate_email, :poc_email, :poc_name, :sub_sign_authority, :sub_sign_authority_title, :fax, :vendor_id
belongs_to :vendor

validates :phone, :poc_name,:sub_sign_authority,:sub_sign_authority_title, :presence=>true
validates :poc_email, :presence => true, :uniqueness => true
validates :poc_email,:format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
