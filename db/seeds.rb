# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Regular", description: "Can read Programs"})
r2 = Role.create({name: "Seller", description: "Can read and create Programs. Can update and destroy own Programs"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Luis", email: "luiscostalac@gmail.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Michel Rolland", email: "michel@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({name: "pochocosta", email: "sispak@gmail.com", password: "chicocomun", password_confirmation: "chicocomun", role_id: r3.id})

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@ivino.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role_id: r1.id)
end

province1 = Province.create({name: "Mendoza"})
province2 = Province.create({name: "Salta"})
province3 = Province.create({name: "Neuquen"})
province4 = Province.create({name: "San Juan"})
province5 = Province.create({name: "La Rioja"})

region1 = Region.create({name: "Luján de Cuyo", description: "Ciudad de la provincia de Mendoza. Pertenece al Departamento Luján de Cuyo.", province_id: province1.id})
region2 = Region.create({name: "Agrelo", description: "Agrelo es una localidad y distrito argentino ubicado en el Departamento Luján de Cuyo de la Provincia de Mendoza", province_id: province1.id})
region3 = Region.create({name: "Valle de Uco", description: "El Valle de Uco es un valle que se encuentra al norte del río Tunuyán y forma parte de los departamentos de Tunuyán, Tupungato y San Carlos, en la provincia de Mendoza, Argentina. Cuenta con una extensión total de 17370 km2.", province_id: province1.id})
region4 = Region.create({name: "Vista Flores, Tunuyán", description: "Vista Flores es una localidad argentina ubicada en el Departamento Tunuyán de la Provincia de Mendoza. Es atravesada por la Ruta Provincial 92, la cual es su principal vía de comunicación vinculándola al norte con Tunuyán y al sur con La Consulta.", province_id: province1.id})

#enterprise1 = Enterprise.create({name: "Bodegas Norton", description: "Fundada en...", region_id: region1.id, user_id: u4.id, phone_number: "541145719766", postal_code: ""})
#enterprise2 = Enterprise.create({name: "Bodega Lagarde", description: "Fundada en...", region_id: region2.id, user_id: u1.id, phone_number: "5491151564980", postal_code: ""})
enterprise3 = Enterprise.create({name: "Bodega Clos de los Siete", description: "Se llamó Clos de los Siete al emprendimiento formado por: Michel & Dany Rolland (Bodega Rolland); Catherine Peré Vergé & Henri Parent (Bodega Monteviejo); Jean Guy & Bertrand Cuvelier (Bodega Cuvelier Los Andes); Alfred y Michele Bonnie (Bodega Diamandes) Clos de los Siete es el vino en común que tienen todos sus socios. Un blend de 57% Malbec, 15% Merlot, 15% Cabernet Sauvigon, 10% Syrah y 3% Petit Verdot. El 50% de la uva de cada una de las Bodegas se destina al Clos de los Siete. Y con el otro 50% cada Bodega hace sus propios vinos.", region_id: region4.id, user_id: u2.id, phone_number: "0262215403692", postal_code: ""})

address1 = Address.create({street: "Clodomiro Silva", number: "S/N", postal_code: "M5560", region_id: region4.id, enterprise_id: enterprise3.id})

i1 = Program.create({name: "Rayban Sunglasses", description: "Stylish shades", price: 120, user_id: u2.id, enterprise_id: enterprise3.id})
i2 = Program.create({name: "Gucci watch", description: "Expensive timepiece", price: 180.99, user_id: u2.id, enterprise_id: enterprise3.id})
#i3 = Program.create({name: "Henri Lloyd Pullover", description: "Classy knitwear", user_id: u3.id})
#i4 = Program.create({name: "Porsche socks", description: "Cosy footwear", user_id: u3.id})


#users = User.order(:created_at).take(6)
#5.times do
#  name = Faker::Lorem.sentence(1)
#  description = Faker::Lorem.sentence(3)
#  users.each { |user| user.programs.create!(name: name, description: description) }
#end





