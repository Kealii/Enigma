class Crack
  attr_reader :key

  def initialize(key = 0)
    @key = [0, 0, 0, 0, 0]
  end

  def cracker
    @key += 1
  end





end




























#   attr_accessor :crack_key
#
#   def initialize
#     @crack_key = crack_key.to_s.rjust(5, '0')
#     @key_crack = @crack_key.to_s.split("")
#     @message = message
#     @results = ""
#   end
#
#   def cracked
#     result = @results
#     result[-7..-1] == ("..end..")
#   end
#
#   def cracker(message = @message, key_crack = @key_crack)
#     until cracked
#       decrypt(@message, @key_crack)
#       key_crack += 1
#     end
#     @key_crack
#   end
#
#   def decrypt(letters = @message, rotation = @key_crack)
#     @results = []
#     letters = string.split("")
#     letters.map.with_index do |letter, index|
#       @results << encrypt_letter(letter, (-1 * rotation))
#     end
#     @results = @results.join
#   end
#
#   def encrypt_letter(letter, rotation)
#     character_map = CharacterMap.new(rotation)
#     cipher_for_rotation = character_map.cipher
#     cipher_for_rotation[letter]
#   end
#
# end
