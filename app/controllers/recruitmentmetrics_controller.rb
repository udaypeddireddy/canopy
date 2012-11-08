class RecruitmentmetricsController < ApplicationController
  
  def index 
    
   @user = User.find(session[:user_id])
   @rec_metric = RecruitmentMetric.find_by_user_id(@user)
  end
  
  def new
   @rec_metric = RecruitmentMetric.new
  end
  
  def create
    @user = User.find(session[:user_id])
    @rec_metric = RecruitmentMetric.new(params[:recruitment_metric])
    render :action => :new unless @rec_metric.save
    if @rec_metric.save
      redirect_to recruitmentmetric_user_path(@rec_metric,@user), :notice=>'profile created successfully'
    end
  end
  
  def show 
   @user = User.find(session[:user_id])
   @rec_metric= RecruitmentMetric.find_by_user_id(@user)
  end
 
 
 def edit
 @user = User.find(session[:user_id])
 @rec_metric = RecruitmentMetric.find_by_user_id(@user)
 end 
 
 def update
 @user = User.find(session[:user_id])
 @rec_metric = RecruitmentMetric.find_by_user_id(@user)
@rec_metric.update_attributes(params[:recruitment_metric])
redirect_to user_recruitmentmetric_path(@rec_metric), :notice=>'updated successfully'
 end

 def destroy
   @rec_metric= RecruitmentMetric.find(params[:id])
   @rec_metric.destroy
   redirect_to recruitmentmetric_path
 end
  
end
