class UpdateSerializer < ActiveModel::Serializer
  attributes :id, :image, :pet_id  , :pet_profile_pic, :pet_name

  def pet_name
    object.pet.name
  end
  def pet_profile_pic
    object.pet.profile_pic
  end
end
