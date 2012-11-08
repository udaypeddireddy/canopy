class PlacementFulfilmentsController < ApplicationController

  def index
    if is_admin
    @placement_fulfilments = PlacementFulfilment.all
    else
      @placement_fulfilments = PlacementFulfilment.where(:recruiter_id=>current_user)
    end
  end

  def show
    @placement_fulfilment = PlacementFulfilment.find(params[:id])
  end

  def new
    session[:consultant]=nil
    session[:sales_person]=nil
    @placement_fulfilment = PlacementFulfilment.new
  end

  def edit
    @placement_fulfilment = PlacementFulfilment.find(params[:id])
  end

  def create
    @placement_fulfilment = PlacementFulfilment.new(params[:placement_fulfilment])
      if @placement_fulfilment.save
        @consultant = User.find_by_id(@placement_fulfilment.consultant_id)
        @client = Client.find(@placement_fulfilment.client_id)
        UserMailer.placement_confirmation(@consultant,@client).deliver
        redirect_to @placement_fulfilment, notice: 'Placement Fulfilment Was Successfully Completed.' 
      else
        render action: "new" 
      end
  end

  def update
    @placement_fulfilment = PlacementFulfilment.find(params[:id])
      if @placement_fulfilment.update_attributes(params[:placement_fulfilment])
       redirect_to @placement_fulfilment, notice: 'Placement Fulfilment Was Successfully Updated.' 
      else
       render action: "edit"
    end
  end

  def destroy
    @placement_fulfilment = PlacementFulfilment.find(params[:id])
    @placement_fulfilment.destroy
     redirect_to placement_fulfilments_url
  end
end
