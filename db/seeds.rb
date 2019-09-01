# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

org = Organization.find_or_create_by!(name: 'The Original')
bar = Bar.find_or_create_by!(organization: org, name: 'Tipsy Toddlers')
user = User.find_or_initialize_by(organization: org, email: 'aidan.mattrick@gmail.com')
user.update!(first_name: 'Aidan', last_name: 'Mattrick', password: 'password', password_confirmation: 'password')
