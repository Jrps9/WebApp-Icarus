# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User1 = User.create!({email: "toto@gmail.com", encrypted_password: "tototo"})
Reservation.destroy_all
User.destroy_all
Work.destroy_all

user1 = User.create!({portrait: "jlpbg", email: "toto@gmail.com", name: "Loulou", password: "tototo", password_confirmation: "tototo"})
user2 = User.create!({portrait: "rorosansbg", email: "titi@gmail.com", name: "Roro", password: "tititi", password_confirmation: "tititi"})
user3 = User.create!({portrait: "chocoprofilssbg", email: "tata@gmail.com", name: "Choco", password: "tatata", password_confirmation: "tatata"})

puts "Users are alive"

Reservations = Reservation.create!([
    {user_id: user1.id, name: "Belle-île en Mer", destination: "Porquerolles", latitude: 42.998653, longitude: 6.167719},
    {user_id: user1.id, name: "La Grande Rade", destination: "Toulon", latitude: 43.124228, longitude: 5.928},
    {user_id: user1.id, name: "Le Bitch-Volley", destination: "Hyères", latitude: 43.035147 , longitude: 6.134487},
    {user_id: user1.id, name: "Ecouter du Jazz", destination: "Les Ambiez", latitude: 43.070172, longitude: 5.786512},
    {user_id: user1.id, name: "Boire des canons", destination: "Marseille", latitude: 43.220103, longitude: 5.330713},
    {user_id: user1.id, name: "Chiller sur la plage", destination: "Cavalaire", latitude: 43.181193, longitude: 6.546536},
    {user_id: user1.id, name: "Faire du surf", destination: "Saint-Cyr", latitude: 43.172589, longitude: 5.686602},
    {user_id: user1.id, name: "Manger des oursins", destination: "Le Pradet", latitude: 43.089240 , longitude: 6.020089},
    ])

puts "Reservations are ok !"

Tache01 = Work.create(name: "test01", description: "desc", user_id: user1.id, status: true)
Tache02 = Work.create(name: "test02done", description: "test status", user_id: user1.id)
Esclave = User.create({email: "esclave@gmail.com", name: "Esclave", password: "tototo", password_confirmation: "tototo"})
Tache01.user << Esclave

puts "Tache créer, esclave au travail"