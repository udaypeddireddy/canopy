class VendorContactsController < ApplicationController
  
  def index
    @vendor=Vendor.find(params[:vendor_id])
    @vendorcontacts = @vendor.vendor_contacts.all
  end

  def show
      @vendor=Vendor.find(params[:vendor_id])
     @vendor_contact = VendorContact.find(params[:id])
  end

  def new
    @vendor=Vendor.find(params[:vendor_id])
    @vendor_contact = VendorContact.new
  end

  # GET /vendor_contacts/1/edit
  def edit
    @vendor=Vendor.find(params[:vendor_id])
    @vendor_contact = VendorContact.find(@vendor)
  end

  
  def create
    @vendor=Vendor.find(params[:vendor_id])
    @vendor_contact = @vendor.vendor_contacts.new(params[:vendor_contact])
      if @vendor_contact.save
        redirect_to placement_fulfilments_path,:notice=>"Vendor Contact Added Successfully"
      else
        render :new
    end
  end

 
  def update
    @vendor=Vendor.find(params[:vendor_id])
    @vendor_contact = VendorContact.find(@vendor)
      if @vendor_contact.update_attributes(params[:vendor_contact])
       redirect_to vendor_vendor_contacts_path(@vendor)
      else
        render :edit
    end
  end

  
  def destroy
    @vendor_contact = VendorContact.find(params[:id])
    @vendor_contact.destroy

  end
end
