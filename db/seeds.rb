100.times do
  Product.create!(name: Faker::Book.title,
                  description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price(range: 100..10000, as_string: true),
               )
end
