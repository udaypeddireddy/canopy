class StatusReportsController < ApplicationController
  
  def index
  if is_admin
    @user = User.all
    @status_reports = StatusReport.all
    @status_report = StatusReport.find_by_user_id(params[:id])
  else 
    @status_reports = current_user.status_reports.all
    @status_report = StatusReport.new
   end
 end
  
def create
 @count = params[:hdncount].to_f
 i=0
 for i in 1..@count
 @status_report = StatusReport.new(:consultant_name=>params["consultant_name"+i.to_s], :technology => params["technology"+i.to_s],
 :consultant_source => params["consultant_source"+i.to_s], :source_requirement=>params["source_requirement"+i.to_s],
 :date => params["date"+i.to_s], :vendor => params["vendor"+i.to_s], :vendor_poc=>params["vendor_poc"+i.to_s],
 :vendor_email=>params["vendor_email"+i.to_s], :vendor_tel=>params["vendor_tel"+i.to_s], :client=>params["client"+i.to_s],
 :status => params["client"+i.to_s])
 @status_report.user_id = current_user.id
  @status_report.save
 end
     redirect_to user_status_reports_path,  :notice=> " Status Report Has Submitted Successfully "
end
  
def show
 @user = current_user
 @status_report = @user.StatusReport.find(params[:id])
    
 @report = StatusReport.find_by_user_id(params[:id])
end

def list
  if params[:list]
    @status_reports = StatusReport.where(:user_id=>params[:id])
  elsif params[:weekly]
   @start_date = Date.parse params[:startdate]
   @end_date =Date.parse params[:enddate]
   @status_reports = StatusReport.where(:user_id=>params[:recruiter_id],:created_at=>@start_date..@end_date)
    end 
    end
    end
