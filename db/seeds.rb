User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

100.times do |n|
  title  = Faker::Book.title
  author  = Faker::Book.author
  publisher  = Faker::Book.publisher
  genre  = Faker::Book.genre
  Book.create!(title:  title,
               author: author,
               publisher:  publisher,
               genre: genre)
end
