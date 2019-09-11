require 'pp'
#why ___dir___ isntead of path
LIQUOR_FILE = File.join(__dir__, 'nc_quarterly_pricing_.csv')



org = Organization.find_or_create_by!(name: 'The Original')
bar = Bar.find_or_create_by!(organization: org, name: 'Tipsy Toddlers')
# user = User.find_or_create_by!(organization: org, email: 'aidan.mattrick@gmail.com')
# user.update!(first_name: 'Aidan', last_name: 'Mattrick', password: 'password', password_confirmation: 'password')

# liquors = []
# File.open(LIQUOR_FILE, 'rt') do |f|
#   header = %i[nc_code brand name age proof capacity cost cost2] 
#   is_first = true
#   f.each_line do |line|
#     if is_first
#       is_first = false
#       next
#     end
#     values = line.split(',')
#     values.map! { |value| value.sub(/\A"(.*)"\z/, '\1') }
#     pairs = header.zip(values)
#     hash = Hash[pairs].slice(:brand, :name, :capacity, :cost)
#     hash[:spirit] = 'Unknown'
#     if hash[:capacity].downcase.ends_with?('ml')
#  find_or_initialize_by     hash[:capacity] = hash[:capacity].sub(/ml\z/i, '').to_f
#     elsif hash[:capacity].downcase.ends_with?('l')
#       hash[:capacity] = hash[:capacity].sub(/ml\z/i, '').to_f * 1000
#     end
#     liquors << hash
#   end
# end
# pp liquors

liquor = Liquor.find_or_create_by! spirit: 'asdasdasd', brand: 'asdasd', name: 'asdasd', capacity: 100, cost: 25
bottle = bar.bottles.create liquor: Liquor.first
=begin bottle_reading = Bottle_readings.find_or_create_by! bottle_id: Bottle.first, reading_time:  =end

liquorOne = [
    ["Bourbon", "Bulleit", "Bulleit Bourbon", 750, 40.32],
    ["Gin", "Hendricks", "Hendricks", 750, 49.32],
    ["Vodka", "Ketel One", "Ketel One", 750, 29.99],
    ["Spiced Rum", "Kraken", "Kraken", 750, 31.99],
    ["Vodka", "Russian Standard", "Russian Standard", 750, 24.49],
    ["Tequila", "Herradura", "Herradura", 750, 75.99]
]

liquorOne.each do |spirit, brand, name, capacity, cost|
    Liquor.create(spirit: spirit, brand: brand,name: name, capacity: capacity, cost: cost)
end

userOne = [
    ["email@email.com", "Aaron", "Boogan", "password" ,"??????????"],
    ["email1@email.com", "Phil", "Gueraa", "password" ,"??????????"],
    ["email12@email.com", "Doug", "Paterson", "password" ,"??????????"],
    ["email123@email.com", "Sue", "Sally", "password" ,"??????????"],
    ["email1234@email.com", "Betty", "Boo", "password" ,"??????????"]
]

userOne.each do |email, first_name, last_name, password_digest, organization_id|
    User.create( email: email, first_name: first_name, last_name: last_name, password_digest: password_digest, organization_id: organization_id)
end

