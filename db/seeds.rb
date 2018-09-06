# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rooms = Room.create( [ { number: 101, floor: 1, bed_number: 2, guests_number: 3, avaliable: true },
                       { number: 102, floor: 1, bed_number: 1, guests_number: 2, avaliable: true },
                       { number: 103, floor: 1, bed_number: 3, guests_number: 4, avaliable: false }
                    ] )

rates = Rate.create( [ { room: Room.find_by( number: 101 ), price: 10000, week_day: 1 },
                       { room: Room.find_by( number: 101 ), price: 10000, week_day: 2 },
                       { room: Room.find_by( number: 101 ), price: 10000, week_day: 3 },
                       { room: Room.find_by( number: 101 ), price: 10000, week_day: 4 },
                       { room: Room.find_by( number: 101 ), price: 10000, week_day: 5 },
                       { room: Room.find_by( number: 101 ), price: 15000, week_day: 6 },
                       { room: Room.find_by( number: 101 ), price: 15000, week_day: 0 },
                       { room: Room.find_by( number: 102 ), price: 5000, week_day: 1 },
                       { room: Room.find_by( number: 102 ), price: 5000, week_day: 2 },
                       { room: Room.find_by( number: 102 ), price: 5000, week_day: 3 },
                       { room: Room.find_by( number: 102 ), price: 5000, week_day: 4 },
                       { room: Room.find_by( number: 102 ), price: 0000, week_day: 5 },
                       { room: Room.find_by( number: 102 ), price: 10000, week_day: 6 },
                       { room: Room.find_by( number: 102 ), price: 10000, week_day: 0 },
                       { room: Room.find_by( number: 103 ), price: 15000, week_day: 1 },
                       { room: Room.find_by( number: 103 ), price: 15000, week_day: 2 },
                       { room: Room.find_by( number: 103 ), price: 15000, week_day: 3 },
                       { room: Room.find_by( number: 103 ), price: 15000, week_day: 4 },
                       { room: Room.find_by( number: 103 ), price: 20000, week_day: 5 },
                       { room: Room.find_by( number: 103 ), price: 25000, week_day: 6 },
                       { room: Room.find_by( number: 103 ), price: 20000, week_day: 0 }
                   ] )

memberships = Membership.create( [  { nombre: "oro", discount: 0.1 },
                                    { nombre: "platino", discount: 0.07 },
                                    { nombre: "bronce", discount: 0.05 }
                                ] )

products = Product.create( [ { nombre: "producto1", price: 100 },
                             { nombre: "producto2", price: 150 },
                             { nombre: "producto3", price: 80 },
                          ])

guests = Guest.create( [ { nombre: "sebastian", apellido: "pineda",
                           documento: 12345, membership: Membership.find_by( nombre: "oro" ) },
                         { nombre: "camilo", apellido: "chavez",
                           documento: 23456, membership: Membership.find_by( nombre: "platino" )},
                         { nombre: "juan", apellido: "fernandez",
                           documento: 34567, membership: Membership.find_by( nombre: "platino" )},
                      ] )
