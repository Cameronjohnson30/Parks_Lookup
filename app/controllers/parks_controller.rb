class ParksController < ApplicationController

  def index 
    @parks = Park.all.paginate(page: params[:page], per_page: 10)
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@parks)
  end

  def create
    @park = Park.create(park_params)
    json_response(@park)
  end

  def update
    @park = Park.find(params[:id])
      if @park.update!(park_params)
      render status: 200, json: {
        message: "This quote has been updated successfully."
      }
    end
  end

  def destroy
    @park = Park.find(params[:id])
    if @park.destroy!
      render status: 202, json: {
        message: "This park has been successfully deleted."
      }
    end
  end 
  
  def park_params
    params.permit(:name, :managed_by, :description)
  end
end