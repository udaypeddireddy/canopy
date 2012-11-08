class UsersController < ApplicationController
   skip_before_filter :require_login
def new
 @user = User.new
end

def newconsultant
  @user=User.new
  session[:consultant]=true
end
def new_sales_person
  @user= User.new
  session[:sales_person]=true
end
def create
 @user = User.new(params[:user])
 
 if @user.save 
   UserMailer.registration(@user).deliver 
   
  if session[:sales_person]==true
      @user_role = OrganizationProfile.new(:user_type=>"recruiter", :role=>"recruiter") 
      @user_role.user=@user
      @user_role.save  
      session[:sales_person]=nil
      redirect_to new_placement_fulfilment_path
   else
      @user_role = OrganizationProfile.new(:user_type=>"consultant", :role=>"consultant") 
       @user_role.user=@user
       @user_role.save
       if session[:consultant]==true
         session[:consultant]=nil
          redirect_to new_placement_fulfilment_path
       else
          redirect_to root_path, :notice=>"Your Profile Has Been Created And Password Sent  To Your Given Email Address" 
       end 
   end
  elsif !@user.save && session[:consultant]==true
    render action: "newconsultant"
    elsif !@user.save && session[:sales_person]==true
      render :new_sales_person
    else
      render :new
       end
 end
 def edit
  @project = Project.find(params[:project_id])
  @user =User.find(params[:id])
  @projects= Project.all
  @users = User.all(:include=>:organization_profile,:conditions=>{'organization_profiles.role'=>"consultant"} )
 end
end