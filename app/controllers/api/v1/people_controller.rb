class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: %i[ show update destroy ]

  # GET /people
  def index
    cliente_person = Person::ClientPerson.all.map do |category|
      category.format_person()
    end

    employee_person = Person::EmployeePerson.all.map do |category|
      category.format_person()
    end

    render json: employee_person + cliente_person
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      if Person.where(id: params[:id]).exists?
        @person = Person.find(params[:id])
      elsif
        render json: { error: "Person id not found" }, status: 404
      end
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :email, :document, :config, type: [ "Person::ClientPerson", "Person::EmployeePerson" ])
    end
end
