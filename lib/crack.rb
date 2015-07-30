require_relative 'offsets'
require_relative 'character_map'


class Crack
  attr_reader :key, :rotations, :message

  def initialize
    @results = []
    @key = [0, 0, 0, 0, 0]
    @message = File.open(ARGV[0], "r")
    @message = File.read(@message)
    # @output = File.open(ARGV[1], "w")

  end

  def cracker
    # @offset = Offsets.new("000000", @key)
    # @final_rotations = @offset.master_rotations
    # decrypt(@message, @final_rotations)
    until cracked?
      @key = @key.join.to_i
      @key += 1
      # p @key
      @key = @key.to_s.rjust(5, "0")
      @key = @key.split('')
      @offset = Offsets.new("000000", @key)
      @final_rotations = @offset.master_rotations
      decrypt(@message, @final_rotations)
    end
    @key
  end

  def cracked?
    # p @results
    temp_results = @results.join[-7..-1]
    p temp_results
    @results.join[-7..-1] == "..end.."
  end

  def decrypt(string = @message, rotation = @final_rotations)
    @results = []
    p @final_rotations
    @letters = string.split("")
    @letters.map.with_index do |letter, index|
      @results << encrypt_letter(letter, (-1 * rotation[index % 4]))
    end
    @results = @results
  end

  def encrypt_letter(letter, rotation)
    character_map = CharacterMap.new(rotation)
    cipher_for_rotation = character_map.cipher
    cipher_for_rotation[letter]
  end






end
# decryption = Decryptor.new(@message, Key.new(key_arg), @date)



























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
