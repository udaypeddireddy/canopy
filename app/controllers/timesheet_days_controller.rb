class TimesheetDaysController < ApplicationController
  def index
    @timesheet = Timesheet.find(params[:timesheet_id])
    @timesheet_days= TimesheetDay.where(:timesheet_id=>@timesheet)
    #@timesheet_days=TimesheetDay.find(@timesheet)
  end
end
