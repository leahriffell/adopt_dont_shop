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
      
    pet.update({
      name: params[:name],
      image: params[:image],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex]
      })

    pet.save

    redirect_to "/pets/#{pet.id}"
  end

  def destroy 
    Pet.destroy(params[:id])
      
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:name, :image, :description, :approximate_age, :sex)
  end
end