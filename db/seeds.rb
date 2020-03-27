# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(
  email: "user@user.com",
  password: 123123,
  authentication_token: "f5o-xRK7fRcSiN4HpMJs"
)

puts 'Criando 5 registros de carros falsos'
5.times do
  veiculo = Veiculo.new(
    marca: Faker::Vehicle.make,
    modelo: Faker::Vehicle.model,
    ano: Faker::Vehicle.year,
    descricao: Faker::Vehicle.standard_specs,
    vendido: false,
  )
  veiculo.save!
end
puts 'Finalizado'