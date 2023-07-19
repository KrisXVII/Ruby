require 'csv'
require 'google/apis/civicinfo_v2'
# print 'Programma partito', "\n"
#
# file_to_parse = 'C:\Users\User\OneDrive\Documenti\Ruby\event_manager\lib\event_attendees.csv'
#
# lines = CSV.readlines(file_to_parse)
# header =  lines.shift
# lines.each do |line|
#   if line != header
#   name = line[2]
#   print name,"\n"
#   end
# end


def clean_zipcode(zipcode)
  len = zipcode.to_s.length
  if len > 5
    zipcode = zipcode[0..4]
  else
    if len < 5
      str_to_append = zipcode.to_s
      instant_len = str_to_append.length
      new_zipcode = String.new
      while instant_len + new_zipcode.length < 5
        new_zipcode += "0"
      end
      new_zipcode += str_to_append
      zipcode = new_zipcode
    end
  end
  return zipcode
  # return zipcode.to_s.rjust(5, '0')[0..4] #simplified version
end

# Implementing API from google for replacing missing zipcode
def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    )
    legislators = legislators.officials
    legislator_names = legislators.map do |legislator|
      legislator.name
    end
    legislator_names.join(", ")
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

# parsing with CSV only built-in functions
print "Parsing del file cominciato\n"
file = CSV.open(
  'C:\Users\User\OneDrive\Documenti\Ruby\event_manager\lib\event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

file.each do |line|
  name = line[:first_name]
  zipcode = clean_zipcode(line[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  puts "#{name}: #{zipcode}, #{legislators}"
end

