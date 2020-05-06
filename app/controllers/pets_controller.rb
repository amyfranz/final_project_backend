class PetsController < ApplicationController
    def create 
        pet = Pet.new(pet_params) 
        if pet.valid? && pet.user.pets.length < 6
            pet.save; 
            render json: {user: UserSerializer.new(pet.user)}
        else
            render json: {messages: pet.errors.full_messages}
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
        update = pet.update(pet_params)
        if update
            render json: {pet: PetSerializer.new(pet)}
        else
            render json: {messages: pet.errors.full_messages}
        end
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