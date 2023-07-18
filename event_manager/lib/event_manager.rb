require 'csv'
print 'Programma partito', "\n"

file_to_parse = 'C:\Users\User\OneDrive\Documenti\Ruby\event_manager\lib\event_attendees.csv'

lines = CSV.readlines(file_to_parse)
header =  lines.shift
lines.each do |line|
  if line != header
  name = line[2]
  print name,"\n"
  end
end
