require 'pp'
#why ___dir___ isntead of path
LIQUOR_FILE = File.join(__dir__, 'nc_quarterly_pricing_.csv')

org = Organization.find_or_create_by!(name: 'The Original')
bar = Bar.find_or_create_by!(organization: org, name: 'Tipsy Toddlers')
user = User.find_or_initialize_by(organization: org, email: 'aidan.mattrick@gmail.com')
user.update!(first_name: 'Aidan', last_name: 'Mattrick', password: 'password', password_confirmation: 'password')

liquors = []
File.open(LIQUOR_FILE, 'rt') do |f|
  header = %i[nc_code brand name age proof capacity cost cost2] 
  is_first = true
  f.each_line do |line|
    if is_first
      is_first = false
      next
    end
    values = line.split(',')
    values.map! { |value| value.sub(/\A"(.*)"\z/, '\1') }
    pairs = header.zip(values)
    hash = Hash[pairs].slice(:brand, :name, :capacity, :cost)
    hash[:spirit] = 'Unknown'
    if hash[:capacity].downcase.ends_with?('ml')
      hash[:capacity] = hash[:capacity].sub(/ml\z/i, '').to_f
    elsif hash[:capacity].downcase.ends_with?('l')
      hash[:capacity] = hash[:capacity].sub(/ml\z/i, '').to_f * 1000
    end
    liquors << hash
  end
end
pp liquors