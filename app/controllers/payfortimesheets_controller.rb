class PayfortimesheetsController < ApplicationController
  def index
    #@user_profile = Assignment.all(:include=>:user,:conditions=>{'assignments.is_active'=>1} )
   #@user_profile = User.all(:include=>:assignment,:conditions=>{'assignments.is_active'=>1} )
    #@user_profile = User.all(:joins => :assignments,:conditions=>{'assignments.is_active'=>1}, :select => "users.*")
    @placement = Placement.all
  end 
end
