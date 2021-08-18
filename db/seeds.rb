# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User1 = User.create!({email: "toto@gmail.com", encrypted_password: "tototo"})

Reservations = Reservation.create!([
    {user_id: 1, name: "Belle-île en Mer", destination: "Porquerolles"},
    {user_id: 1, name: "La Grande Rade", destination: "Toulon"},
    {user_id: 1, name: "Le Bitch-Volley", destination: "Hyères"},
    {user_id: 1, name: "Ecouter du Jazz", destination: "Les Ambiez"},
    {user_id: 1, name: "Boire des canons", destination: "Marseille"},
    {user_id: 1, name: "Chiller sur la plage", destination: "Cavalaire"},
    {user_id: 1, name: "Faire du surf", destination: "Saint-Cyr"},
    {user_id: 1, name: "Manger des oursins", destination: "Le Pradet"},
    ])