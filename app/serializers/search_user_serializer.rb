class SearchUserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :profile_pic
end
