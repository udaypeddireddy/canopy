class ProjectsController < ApplicationController
  

def index
@user = User.all(:include=>:organization_profile,:conditions=>{'organization_profiles.role'=>"consultant"} )
@projects = Project.all
end
  
def create
@project = Project.new(params[:project]) 

if @project.save
 redirect_to projects_path, :notice=>"Project Created Successfully"
  else
 render :new, :notice=>"Error Creating Project"
  end
end
def new
  @project = Project.new
end
 
def show
 @project = Project.find(params[:client_id])
end

def update
  @project = Project.find(params[:id])
  @project.update_attributes(params[:project])
  if @project.save
      redirect_to project_path(@project),:notice=>"Project Updated Successfully"
  end
end
  
def assignproject
@project = Project.find(params[:id])
@user = User.find(params[:consultant_id])
@new_assignment = Assignment.new(:is_active=>true)
@new_assignment.user = @user
@new_assignment.project = @project
if @new_assignment.save
redirect_to projects_path, :notice=>"Project Assigned Successfully"
else
  redirect_to projects_path, :notice=>"Project is Not Assigned To The Consultant Please Try Again"
end
end

def destroy
 @project = Project.find(params[:id])
 @project.destroy
redirect_to projects_path
end

end