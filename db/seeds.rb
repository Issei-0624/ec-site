100.times do
  Product.create!(name: Faker::Book.title,
                  description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price(range: 100..10000, as_string: true),
               )
end

User.create(email: 'admin@test.com', password: 'password')
User.create(email: 'satou@test.com', password: 'password')
User.create(email: 'suzuki@test.com', password: 'password')
User.create(email: 'tanaka@test.com', password: 'password')
User.create(email: 'test@test.com', password: 'password')