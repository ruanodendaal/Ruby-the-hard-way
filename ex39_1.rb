# same as states
regions = {
  'South East' => 'SE',
  'South West' => 'SW',
  'Midlands' => 'MID'
}

counties = {
  'SE' => 'Hertfordshire',
  'SW' => 'Somerset',
  'MID' => 'Warwickshire'
}

towns = {
  'Hertfordshire' => 'Rickmansworth',
  'Buckinghamshire' => 'Amersham',
  'Bristol' => 'Somerset',
  'Bath' => 'Somerset',
  'Birmingham' => 'Warwickshire'
}

# puts some towns
puts '-' * 10
puts "SE county has #{counties['SE']}"

# puts some counties in regions
puts "South East has: #{towns[counties[regions['South East']]]} "

# abbreviations
puts '-' * 10
regions.each { |region, abbrev| puts "#{abbrev} is the abbreviation of #{region}" }

# which towns are in which counties
puts '-' * 10
towns.each { |county, town| puts "#{county} has the town #{town}"}
