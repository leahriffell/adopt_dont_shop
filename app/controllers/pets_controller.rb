class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show 
    @pet = Pet.find(params[:id])
  end

  def new 
    @shelter = Shelter.find(params[:id])
    @pet = Pet.new
  end

  def create 
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create(pet_params)
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit 
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])    
    pet.update(pet_params)
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy 
    Pet.destroy(params[:id])
      
    redirect_to "/pets"
  end

  def change_adoption_status
    pet = Pet.find(params[:id])
    if pet.adoption_status == "Adoptable"
      pet.adoption_status = "Pending"
    else 
      pet.adoption_status = "Adoptable"
    end
  end

  private

  def pet_params
    params.permit(:name, :image, :description, :approximate_age, :sex)
  end
end