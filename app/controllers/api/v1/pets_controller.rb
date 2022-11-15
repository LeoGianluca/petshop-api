class Api::V1::PetsController < ApplicationController
  before_action :set_pet, only: %i[ show update destroy ]

  # GET /pets
  def index
    @pets = Pet.all

    render json: @pets
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      if Pet.where(id: params[:id]).exists?
        @pet = Pet.find(params[:id])
      elsif 
        render json: { error: "Pet id not found" }, status: 404
      end
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.fetch(:pet).require(:name, :age, :species_id, :breed_id)
    end
end
