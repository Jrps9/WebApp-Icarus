# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservations = Reservation.create([{user_id: 1, name: "Belle-île en Mer", destination: "Porquerolles"}, {user_id: 1, name: "La Grande Rade", destination: "Toulon"}])