class HomeController < ApplicationController
  skip_before_filter :require_login
def index
  
end

def show

if is_admin
@users = User.all #(:include=>:organization_profile,:conditions=>{'organization_profiles.role'=>"consultant"} )  
end

@timesheets = current_user.timesheets.last(2) 
@user_requests = current_user.user_requests.last(2)

if recruiter
@status_reports = current_user.status_reports.last(2)
end

end
end
