class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :pet_id
      t.integer :user_id
    end
  end
end
