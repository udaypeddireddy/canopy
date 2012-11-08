module UserHelper
  def consultants_menu_collection
   User.all(:include=>:organization_profile,:conditions=>{'organization_profiles.role'=>"consultant"} ).collect{|consultant| [consultant.firstname, consultant.id]}
  end
  
   def recruiters_menu_collection
   User.all(:include=>:organization_profile,:conditions=>{'organization_profiles.role'=>"recruiter"} ).collect{|recruiter| [recruiter.firstname, recruiter.id]}
  end

  
end