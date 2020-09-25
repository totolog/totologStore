# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
                last_name:  "Admin",
                first_name:  "User",
                email: "example@railstutorial.org",
                tel: "00000000000",
                password:              "foobar",
                password_confirmation: "foobar",
                admin: true,
                activated: true,
                activated_at: Time.zone.now
            )

99.times do |n|
    # name  = Faker::Name.name
    last_name = Faker::Name.last_name
    first_name = Faker::Name.first_name
    email = "example-#{n+1}@railstutorial.org"
    tel = "0000000000#{n+1}"
    password = "password"
    User.create!(
                    last_name: last_name,
                    first_name: first_name,
                    email: email,
                    tel: tel,
                    password:              password,
                    password_confirmation: password,
                    activated: true,
                    activated_at: Time.zone.now
                )
end