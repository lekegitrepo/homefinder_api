# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "seeding 25 homes"

home_types = [
  'Condo', 'Apartment', 'Co-Op', 'Single-Family (Detached)', 'Tiny Home',
  'Townhome', 'Cape Cod', 'Colonial', 'Contemporary', 'Cottage', 'Craftsman',
  'Greek Revival', 'Farmhouse', 'French Country', 'Mediterranean',
  'Midcentury Modern', 'Ranch', 'Split-Level', 'Tudor', 'Victorian'
]

# File is stored in ./public/my_folder/picture.jpg
# File.file? "#{Rails.public_path}/my_folder/picture.jpg"

5.times do |h|
  image = "images/#{h}.jpg"
  Home.create home_type: home_types[rand(0...20)], description: Faker::Quote.matz,
            location: Faker::Address.full_address, price: 200 * rand(10..30),
            image_link: image if File.file?("#{Rails.public_path}/#{image}")
end

Home.create home_type: home_types[4], description: Faker::Quote.matz,
            location: Faker::Address.full_address, price: 200 * rand(10..30),
            picked: true, image_link: '/images/9.jpg' if File.file?("#{Rails.public_path}/images/9.jpg")
