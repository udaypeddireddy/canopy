class UserMailer < ActionMailer::Base
  default from: "ukreddys@gmail.com"
def registration(user)
  @user = user
  attachments["logo.jpg"] = File.read("#{Rails.root}/public/logo.jpg")
  mail(:to =>@user.email, :subject=>"Welcome To Canopy One")
end
def timesheet_report(user,timesheet)
  @user = user
  @timesheet = timesheet
  mail(:to=> "hrcanopy@gmail.com", :subject=>"Timesheet Report of Mr/Mrs " + " " + @user.firstname + " " + "for" + " " + Date.strptime(@timesheet.start_date.to_s,"%Y-%m-%d").strftime("%m-%d-%Y") + " " +  "to" + " " + Date.strptime(@timesheet.end_date.to_s,"%Y-%m-%d").strftime("%m-%d-%Y") )
end
def timesheet_status(user,timesheet)
@user = user
@timesheet = timesheet
mail(:to=>@user.email, :subject=>"Status of your timesheet report for" + " " + Date.strptime(@timesheet.start_date.to_s,"%Y-%m-%d").strftime("%m-%d-%Y") + " " +  "to" + " " + Date.strptime(@timesheet.end_date.to_s,"%Y-%m-%d").strftime("%m-%d-%Y")  )
end
def request_submit(user,userrequest)
@user = user
@request = userrequest
mail(:to=>"hrcanopy@gmail.com", :subject=>@request.request_for+ " " + "Application of  Mr/Mrs " + @user.firstname )
end

def request_status(user,userrequest)
@user = user
@request = userrequest
mail(:to=>@user.email, :subject=>"Request status")
end

def user_agreement(user)
  @user = user
  attachments["msa.doc"] = File.read("#{Rails.root}/uploads/msa.doc")
  mail(:to=>"hrcanopy@gmail.com", :subject=>"Empolyee Agreement")
end
def placement_confirmation(user,client)
  @consultant=user
  @client = client
  mail(:to=>@consultant.email,:subject=>"Placement Confirmation ")
  
end
end