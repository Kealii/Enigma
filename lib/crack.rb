require_relative 'offsets'
require_relative 'character_map'


class Crack
  attr_reader :key, :final_rotations, :message

  def initialize
    @results = []
    @key = [0, 0, 0, 0, 0]
    @date = ARGV[2]
    collect_message
    cracker
    write_cracked_message
  end

  def collect_message
    file = "./files/" + ARGV[0].to_s
    @input = File.open("#{file}", "r")
    @message = File.read(@input)
  end

  def write_cracked_message
    file = "./files/" + ARGV[1].to_s
    @output = File.open("#{file}", "w")
    @output.write(@results.join)
    @output.close
    puts "Created #{ARGV[1]} with #{@key} and #{@date}"
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

crack = Crack.new
