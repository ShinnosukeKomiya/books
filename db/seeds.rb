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
