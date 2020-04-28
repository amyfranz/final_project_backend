class PetsController < ApplicationController
    def create 
        pet = Pet.create(pet_params) 
        if pet.valid?
            render json: pet, each_serializer: PetSerializer
        else
            render json: {message: "did not create a new pet"}
        end
    end

    def index 
        pets = Pet.all
        render json: pets, each_serializer: PetSerializer
    end 

    def show
        pet = Pet.find_by(id: params[:id])
        render json: pet, each_serializer: PetSerializer
    end 

    def update
        pet= Pet.find_by(id: params[:id])
        pet.update(pet_params)
        pet.save
        render json: pet
      end

    private

    def pet_params
        params.require(:pet).permit(:bio, :user_id, :name)
    end
end