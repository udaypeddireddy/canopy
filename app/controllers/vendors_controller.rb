class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    #render : @vendor 
  end
  
  def new
    @vendor = Vendor.new
    @vendor.build_vendor_contact
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(params[:vendor])
    
if @vendor.save
  if @vendor.parent_id!=1
    @vid = @vendor.parent_id
     redirect_to new_placement_fulfilment_path(:vid=>@vid,:sid=>@vendor.id), notice: 'Vendor Created Successfully ' 
  else
      redirect_to new_placement_fulfilment_path(:vid=>@vendor.id), notice: 'Vendor Created Successfully ' 
  end
       
      else
         render action: "new" 
    end
  end
  
  def update
    @vendor = Vendor.find(params[:id])

      if @vendor.update_attributes(params[:vendor])
        redirect_to @vendor, notice: 'Vendor Information Updated Successfully .' 
      else
         render action: "edit" 
    end
  end
  
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
     redirect_to vendors_url 
  end
end
