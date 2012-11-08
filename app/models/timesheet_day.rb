class TimesheetDay < ActiveRecord::Base
  attr_accessible :comments, :date, :over_time, :regular_time, :timesheet_id
  belongs_to :timesheet
end
