require 'pp'
LIQUOR_FILE = File.join(__dir__, 'nc_quarterly_pricing_.csv')
SPIRIT_NAMES = %w[vodka rum brandy gin whiskey bourbon tequila mezcal]
org = Organization.find_or_create_by!(name: 'The Original')
bar = Bar.find_or_create_by!(organization: org, name: 'Tipsy Toddlers')
user = User.find_or_create_by!(organization: org, email: 'aidan.mattrick@gmail.com')
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
    if hash[:capacity].downcase.end_with?('ml')
      hash[:capacity] = hash[:capacity].sub(/ml\z/i, '').to_f
    elsif hash[:capacity].downcase.end_with?('l')
      hash[:capacity] = hash[:capacity].sub(/ml\z/i, '').to_f * 1000
    end
    hash[:capacity] = hash[:capacity].to_i
    hash[:cost] = hash[:cost].sub(/\A\$/, '').to_f
    hash[:spirit] = SPIRIT_NAMES.detect { |s| hash[:name].downcase.include?(s) }&.titleize
    hash[:spirit] ||= 'Unknown'
    liquors << hash
  end
end

liquors.each do |liquor|
  Liquor.find_or_create_by!(liquor) rescue nil
end