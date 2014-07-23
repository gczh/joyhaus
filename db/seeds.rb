# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!([
  { sku: "GCC-001", name: "Enchanted Blue Ship", description: "Fancy an exquisite blue ship that will catch the eyes of the recipient? This is it!", price: 5.79, cost_price: 3.75, weight: 0.25, on_sale: true, featured: true, cover_picture: "http://i.imgur.com/6FOYQvm.jpg"},
  { sku: "GCC-002", name: "Birthday Piano Angel", description: "Looking for an awesome birthday card for a girl? This cute piano angel card should do the trick", price: 3.79, cost_price: 1.25, weight: 0.23, on_sale: true, featured: true, cover_picture: "http://i.imgur.com/5mi2KtL.jpg"},
  { sku: "GCC-003", name: "A Warm Merry Christmas", description: "Looking for a card that is reminiscent of your past christmas memories? Grab this one quickly!", price: 3.79, cost_price: 1.25, weight: 0.26, on_sale: true, featured: true, cover_picture: "http://i.imgur.com/o3LISGM.jpg"},
  { sku: "GCC-004", name: "Sweet Valentine", description: "A love that will never fail. We're sure you're thinking of that too! Now grab this card and send it to your significant other and win their hearts once again", price: 3.79, cost_price: 1.25, weight: 0.23, on_sale: true, featured: true, cover_picture: "http://i.imgur.com/kOlSJqD.jpg"}
])