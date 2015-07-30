require_relative 'offsets'
require_relative 'character_map'


class Crack
  attr_reader :key, :final_rotations, :message

  def initialize
    @results = []
    @key = [0, 0, 0, 0, 0]
    @message = File.open(ARGV[0], "r")
    @message = File.read(@message)
    @output = File.open(ARGV[1], "w")
    @date = ARGV[2]

  end

  def cracker
    until cracked?
      @key = @key.join.to_i
      @key += 1
      @key = @key.to_s.rjust(5, "0")
      @key = @key.split('')
      @offset = Offsets.new(@date, @key)
      @final_rotations = @offset.master_rotations
      decrypt(@message, @final_rotations)
    end
    @key = @key.join
    p "Created #{ARGV[1]} with #{@key} and #{@date}"
  end

  def cracked?
    p @key
    temp_results = @results.join[-7..-1]
    @results.join[-7..-1] == "..end.."
  end

  def decrypt(string = @message, rotation = @final_rotations)
    @results = []
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
