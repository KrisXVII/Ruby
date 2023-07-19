require 'csv'
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

# parsing with CSV only built-in functions
print "Parsing del file cominciato\n"
file = CSV.open(
  'C:\Users\User\OneDrive\Documenti\Ruby\event_manager\lib\event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

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
end


file.each do |line|
  name = line[:first_name]
  zipcode = clean_zipcode(line[:zipcode])
  puts "#{name}: #{zipcode}"
end

