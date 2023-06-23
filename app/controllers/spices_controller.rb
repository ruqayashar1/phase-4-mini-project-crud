class SpicesController < ApplicationController
    # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end


  # POST /plants
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end
#patch
  def update
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end 
#delete
  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  private

  def spice_params
    params.permit(:name, :image, :description, :notes, :rating)
  end
end


