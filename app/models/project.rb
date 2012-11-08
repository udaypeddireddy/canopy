class Project < ActiveRecord::Base
attr_accessible :projectname, :description, :end_date, :project_location, :rate, :start_date, :client_id

validates :projectname,  :start_date, :end_date, :rate, :presence=>true
validates :projectname, :uniqueness=>true

belongs_to :client
has_many :users, :through => :assignments
has_many :assignments
end
