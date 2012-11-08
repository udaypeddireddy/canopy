class Vendor < ActiveRecord::Base
attr_accessible :address1, :address2, :city,  :federal_id, :name, :parent_id, :state, :zip, :vendor_contacts_attributes
has_and_belongs_to_many :clients
has_one :vendor_contact
validates_uniqueness_of :name
validates_presence_of :name, :address1, :city,:state, :zip, :federal_id, :on=>:create
validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message=>"Code is Not Valid"

validates :federal_id, :numericality=>true
acts_as_tree :order => "name"
accepts_nested_attributes_for :vendor_contact
attr_accessible :vendor_contact_attributes
end
