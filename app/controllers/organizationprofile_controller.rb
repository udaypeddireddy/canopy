class OrganizationprofileController < ApplicationController
 
  def index 
   @user = User.find(session[:user_id])
   @profile = OrganizationProfile.find_by_user_id(@user)
  end
  
  def new
    @profile = OrganizationProfile.new
  end
  
  def create
    @user = User.find(session[:user_id])
    @profile = OrganizationProfile.new(params[:organization_profile])
    render :action => :new unless @profile.save
    if @profile.save
      redirect_to user_organizationprofile_path(@user,@profile), :notice=>'Profile Created Successfully'
    end  
  end
   
  def show 
   @user = User.find(session[:user_id])
   @profile = OrganizationProfile.find_by_user_id(@user)
  end
 
 
 def edit
  @user = User.find(session[:user_id])
 @profile = OrganizationProfile.find_by_user_id(@user)
   
 end 
 
 def update
 @user = User.find(session[:user_id])
 @profile = OrganizationProfile.find_by_user_id(@user)
@profile.update_attributes(params[:organization_profile])
redirect_to user_organizationprofile_path(@profile), :notice=>'Updated Successfully'
end


 def destroy
   @profile = OrganizationProfile.find(params[:id])
   @profile.destroy
   redirect_to personalprofiles_path
 end
 
end
