class SessionsController < ApplicationController

skip_before_filter :require_login 
def create
 user = User.authenticate(params[:email], params[:password])
 if user && user.password_reset==true
   session[:user_id] = user.id
   redirect_to summary_path, :notice => "Logged in!"
 elsif user 
    session[:user_id] = user.id 
    redirect_to changepassword_path, :notice =>"Please Reset Your Password"
 else
   redirect_to root_path, :notice=>"Invalid Email or Password"
end
end
def destroy
 # session[:user_id] = nil
  session.clear
  redirect_to root_path, :notice => "Logged Out!"
end

end
