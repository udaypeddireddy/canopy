class Timesheet < ActiveRecord::Base
attr_accessible :date_worked, :document_name, :hours_worked, :project_id, :proof_path, :proof_uploaded, :status, :start_date, :end_date
attr_accessor :my_file
#validates_presence_of :my_file,:on=>:create
belongs_to :user
belongs_to :client
#validates :date_worked, :document_name, :hours_worked,:proof_path, :proof_uploaded, :presence=>'true'
belongs_to :project
has_many :timesheet_days
end
