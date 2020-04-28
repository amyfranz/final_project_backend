class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :bio
      t.string :profile_pic
      t.integer :user_id
    end
  end
end
