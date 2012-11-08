class ApplicationController < ActionController::Base
protect_from_forgery
before_filter :require_login
private
def require_login
unless logged_in?  
#flash[:error] = "You must be logged in to access this section"
redirect_to root_path, :notice=>"You must be logged in to access this section"# halts request cycle
end
end

def logged_in?
    !!current_user
end
def recruiter
  @recruiter ||= OrganizationProfile.find_by_user_id(current_user).role=="recruiter"
end
def current_user
    @current_user ||= User.find_by_id(session[:user_id])
end

def is_admin
  @is_admin ||= OrganizationProfile.find_by_user_id(current_user).is_admin
end

def consultant
  @consultant ||= OrganizationProfile.find_by_user_id(current_user).role=="consultant"
end
def client
  
  if current_user && !is_admin
    @assignment = current_user.assignments.find_by_is_active(true) 
    if @assignment
    @project = Project.find(@assignment.project_id)
    @client ||=@project.client
   end
end
end


def project_assigned
  
  @assigned ||= Assignment.find_by_user_id(current_user.id)
 
end

helper_method :current_user
helper_method :is_admin
helper_method :client
helper_method :project_assigned
helper_method :recruiter
helper_method :consultant
end