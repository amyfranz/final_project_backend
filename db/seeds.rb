# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# pet1 = Pet.create(name: "Bob the Goldfish", bio: "Just a grumpy fish, swimming in a lonely tank.", user_id: 3)
# pet2 = Pet.create(name: "Lulu", bio: "I live every day with a hop.", user_id: 3)
# pet3 = Pet.create(name: "Tony", bio: "What is life.", user_id: 2)

# followings1 = Following.create(pet_id: 1, user_id: 1)
# followings2 = Following.create(pet_id: 1, user_id: 2)
# followings3 = Following.create(pet_id: 1, user_id: 3)
# followings4 = Following.create(pet_id: 2, user_id: 3)

posts = Post.create(bio: "cool", pet_id: 3, posted: Time.now)
# posts2 = Post.create(bio: "yo2", pet_id: 1, posted: Time.now)

# like1 = Like.create(post_id: 1, user_id: 2, created_at: Time.now)
# like2 = Like.create(post_id: 1, user_id: 1, created_at: Time.now)

# comment1 = Comment.create(post_id: 1, user_id: 2, comment:"cool", created_at: Time.now)
# comment2 = Comment.create(post_id: 1, user_id: 1, comment:"2cool", created_at: Time.now)