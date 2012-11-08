module StatusReportsHelper

def  status_report_user_name(user)
 user.firstname + " " + user.lastname rescue ""

  end
end
