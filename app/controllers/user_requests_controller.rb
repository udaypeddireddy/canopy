class UserRequestsController < ApplicationController
  
def index
 if is_admin
   @user_request = UserRequest.all
 
    
 else if !is_admin
   @user_request = current_user.user_requests.all

   end
  end
end

def  create    
  @user = current_user
  @request = UserRequest.new(params[:user_request])
  
  if params[:user_id]
  @user = User.find_by_id(params[:user_id])
  @request.user_id = params[:user_id]
  @request.save
  UserMailer.request_submit(@user,@request).deliver
  render :action => :new unless @request.save
  redirect_to user_requests_path, :notice=>'Request Submitted Successfully'
  
  else 
  @request.user_id = current_user.id
  @request.save
  UserMailer.request_submit(@user,@request).deliver
  render :action => :new unless @request.save
  redirect_to user_user_requests_path(current_user), :notice=>'Request Submitted Successfully'

 end
end
  
  def new
    
    @request = UserRequest.new
    
  end
def show 
  @user_request = UserRequest.find(params[:id])
end
  
def update_requests
    
 if params[:approve]
  @user_requests = UserRequest.find(params[:request_ids])  
  @user_requests.each do |request|  
  request.update_attributes(:is_approved=>true)
  @user = User.find(request.user_id)
  @request = request
  UserMailer.request_status(@user,@request).deliver
  flash[:notice] = "Requests approved Successfully" 
 end
 
 elsif params[:reject]
  @user_request = UserRequest.find(params[:request_ids])  
  @user_request.each do |request|  
  request.update_attributes(:is_approved=>false)
  @user = User.find(request.user_id)
  @request = request
  UserMailer.request_status(@user,@request).deliver
  flash[:notice] = "Requests Rejected Successfully"

 end
end
 
 redirect_to user_requests_path  
  end   
end
