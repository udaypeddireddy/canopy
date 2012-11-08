class TimesheetsController < ApplicationController
  def index
   @user = current_user  
  # @client = Project.find_by_user_id(:params[:id])
 if is_admin
 @timesheets = Timesheet.all
 else 
 
 @project_assigned_on= current_user.assignments.find_by_is_active(true).created_at  
 @timesheets = @user.timesheets.all
 @timesheet = Timesheet.new
 
    end
 end

def new
 @timesheet = Timesheet.new
end
  
def create 
  
  @user = current_user
  tmp = params[:timesheet][:my_file].tempfile
  @filename=params[:timesheet][:my_file].original_filename
  require 'fileutils'
  file = File.join("uploads", params[:timesheet][:my_file].original_filename)
  FileUtils.copy_file(tmp.path,file)
  @filepath = "#{Rails.root}/"+file
   #@count = params[:days].to_f
  # @week_count =params[:hdnweeks].to_f
  @start_date=Date.parse params[:startdate]
  @end_date =Date.parse params[:enddate]
 # @start_date_converted=@start_date.to_s
  
   @timesheet = Timesheet.new(:start_date=>@start_date,:end_date=>@end_date,:proof_path=>@filepath)
    params[:hdndayscount].split(",").each_with_index do |c,i|
      c.to_i.times do |d|
        #binding.pry
        work_date = Date.parse params["hdn#{i+1}#{d}"]
        regulartime_hours = params["Regulartime_worked#{i+1}#{d}"].to_f
        overtime_hours = params["Overtime_worked#{i+1}#{d}"].to_f
        @timesheet.timesheet_days << TimesheetDay.new(:date=>work_date,:regular_time=> regulartime_hours ,:over_time=>overtime_hours)
   end
    end
      @timesheet.user=current_user
      @project= current_user.assignments.find_by_is_active(true).project_id
      @timesheet.project_id=@project
   @timesheet.save
   UserMailer.timesheet_report(@user,@timesheet).deliver
    redirect_to (user_timesheets_path(@user)), :notice=>"Timesheet Submitted Successfully"
  end
def show
 @user = current_user
 @timesheet = @user.timesheets.find(params[:id])
end
  
def edit
 @user = current_user
 @timesheet = @user.timesheets.find(params[:id])
end
  
def update
 @timesheet = Timesheet.find(params[:id])
 @timesheet.update_attributes(params[:timesheet])
 redirect_to user_timesheets_path, :notice=>'Timesheet Updated Successfully'
end 
  
def update_multiple

 if params[:approve]
 @timesheets = Timesheet.find(params[:timesheet_ids]) 
 @timesheets.each do |timesheet|  
 timesheet.update_attributes(:status=>true)
 @user = User.find(timesheet.user_id)
 @timesheet= timesheet
 UserMailer.timesheet_status(@user,@timesheet).deliver
 flash[:notice] = "Timesheet Approved Successfully"  
 end
 elsif params[:reject]
 @timesheets = Timesheet.find(params[:timesheet_ids]) 
 @timesheets.each do |timesheet|  
 timesheet.update_attributes(:status=>false) 
 @user = User.find(timesheet.user_id)
 @timesheet=timesheet
  UserMailer.timesheet_status(@user,@timesheet).deliver
 flash[:notice] = "Timesheet Rejected Successfully"
   end
end 
 redirect_to timesheets_path  
end   

def download_timesheet
    sample = Timesheet.find(params[:id])
    send_file  sample.proof_path,
    :filename => File.basename(sample.proof_path),
    :disposition => 'attachment'
    flash[:notice] = "Your File Has Been Downloaded"
  end

def destroy
 @timesheet = Timesheet.find(params[:id])
 @timesheet.destroy
 redirect_to timesheets_path
end
end
