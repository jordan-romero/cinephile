# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

m1 = Movie.create(title: "Test Movie 1", release_date: "01-01-01", genre: "Fake", runtime: "100")

l1 = List.create(name: "Test Watched List", description: "I am a test watched list not a real watched list")

u1 = User.create(name: "Jordles", username: "Jordles", password: "jordles", email: "jordles@gmail.com")

