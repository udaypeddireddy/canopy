module TimesheetHelper
  
  def  timesheet_user_name(user)
    user.firstname + " " + user.lastname rescue ""
  end

end
