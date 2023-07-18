#
# def caesar_cypher(str, int)
#   numeric_arr = str.bytes
#   shifted_arr = numeric_arr.map{|el| el+int}
#   cyphed_message=shifted_arr.map { |c| c.chr }.join
#   cyphed_message
# end
#
# def caesar_decypher(str, int)
#   numeric_arr = str.bytes
#   shifted_arr = numeric_arr.map{|el| el-int}
#   decyphed_message=shifted_arr.pack('c*')
#   decyphed_message
# end
#
# cyphed = caesar_cypher("What a string!", 5)
# print cyphed,"\n"
#
# decyphed = caesar_decypher('\mfy%f%xywnsl&', 5)
# print decyphed


def caesar_cipher(string, shift)
  alphabet  = Array('a'..'z')
  non_caps  = Hash[alphabet.zip(alphabet.rotate(shift))]

  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]

  encrypter = non_caps.merge(caps)

  string.chars.map { |c| encrypter.fetch(c, c) }
end

p caesar_cipher("What a string!", 5).join
