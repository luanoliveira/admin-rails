# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..100 do
    email = Faker::Internet.email;
    op = Operador.find_by(email: email)

    if !op.nil?
        next
    end

    Operador.create(
        nome: Faker::Name.name, 
        email: email
    )
end
