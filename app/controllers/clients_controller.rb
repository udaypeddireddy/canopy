class ClientsController < ApplicationController
  
def index
   @vendor = Vendor.find(params[:vendor_id])
   @clients = @vendor.clients.all
   @vendors = Vendor.where(:parent_id=>1)
end
def new
   @vendor = Vendor.find(params[:vendor_id])
   @sub_vendor = params[:sid]
   @client = @vendor.clients.new  
end

 def create
  @vendor = Vendor.find(params[:vendor_id])
  @sub_vendor = params[:subvendor_id]
  @client = @vendor.clients.new(params[:client])
  @vendor.clients<<@client
  if @client.save     
   redirect_to new_placement_fulfilment_path(:vid=>@vendor.id,:client_id=>@client,:sid=>@sub_vendor), :notice=> 'Client Created Successfully'
  else
   render :new, :notice=>'Error Creating Client'
  end
end


def show
  @client = Client.find(params[:id])
end

def edit
  @client = Client.find(params[:id])
end

def update
  @client = Client.find(params[:id])
  @client.update_attributes(params[:client])
    redirect_to client_path(@client), :notice=>'Updated Successfully' 
end

def destroy
  @client = Vendor.client.find(params[:id])
  @client.destroy
    redirect_to vendor_clients_path
end  
end
