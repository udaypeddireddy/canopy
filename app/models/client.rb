class Client < ActiveRecord::Base
  attr_accessible :name,:email, :phone, :address1, :address2, :manager_name, :manager_email, :manager_phone, :note,:alternate_email
  
validates :name, :manager_email, :manager_name, :manager_phone, :presence=>true
    
validates :manager_email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
validates_uniqueness_of :name
validates_numericality_of :manager_phone, :on => :create          
has_and_belongs_to_many :vendors
has_many :projects
accepts_nested_attributes_for :projects
end
