class ParksController < applicationController

  def index 
    @parks = Park.applicationController
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
    @park.update(park_params)
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
  end 
  
    private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def park_params
    params.permit(:name, :managed_by, :description)
  end
end