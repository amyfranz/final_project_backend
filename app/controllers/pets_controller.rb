class PetsController < ApplicationController
    def create 
        pet = Pet.new(pet_params) 
        if pet.valid? && pet.user.pets.length < 6
            pet.save; 
            render json: pet.user, each_serializer: UserSerializer
        else
            render json: {message: "new pet could not be created, please check that you have 5 or less pets"}
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
        pet = pet.update(pet_params)
        pet= Pet.find_by(id: params[:id])
        render json: pet, each_serializer: PetSerializer
      end

      def destroy
        pet = Pet.find_by(id: params[:id])
        pet.destroy
      end

    private

    def pet_params
        params.require(:pet).permit(:bio, :user_id, :name, :profile_pic)
    end
end