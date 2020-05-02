class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.text :bio
      t.string :effect
      t.integer :pet_id
      t.timestamp :posted
    end
  end
end
