class Api::V1::SpeciesController < ApplicationController
  before_action :set_species, only: %i[ show update destroy ]

  # GET /species
  def index
    @species = Species.all

    render json: @species
  end

  # GET /species/1
  def show
    render json: @species
  end

  # POST /species
  def create
    @species = Species.new(species_params)

    if @species.save
      render json: @species, status: :created
    else
      render json: @species.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /species/1
  def update
    if @species.update(species_params)
      render json: @species
    else
      render json: @species.errors, status: :unprocessable_entity
    end
  end

  # DELETE /species/1
  def destroy
    @species.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      if Species.where(id: params[:id]).exists?
        @species = Species.find(params[:id])
      elsif
        render json: { error: "Species id not found" }, status: 404
      end
    end

    # Only allow a list of trusted parameters through.
    def species_params
      params.fetch(:species).require(:description)
    end
end
