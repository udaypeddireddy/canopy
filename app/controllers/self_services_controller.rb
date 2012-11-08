class SelfServicesController < ApplicationController
 
 def index
   @application_forms = SelfService.all
 end
 
 def new
 end
 
def create
  tmp = params[:self_service][:my_file].tempfile
  @filename=params[:self_service][:my_file].original_filename
  require 'fileutils'
  file = File.join("uploads", params[:self_service][:my_file].original_filename)
  FileUtils.copy_file(tmp.path,file)
  @filepath ="#{Rails.root}/"+file
  @self_serviceform=SelfService.new(:name=>@filename,:path=>@filepath)
     if @self_serviceform.save
        redirect_to self_services_path,:notice=>"File Upload Completed "
     else 
        render :new
     end
end

  def download
    sample = SelfService.find(params[:id])
    send_file  sample.path,
    :filename => sample.name,
    :disposition => 'attachment'
    flash[:notice] = "Your File Has Been Downloaded"
  end
end
