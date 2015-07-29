require_relative 'character_map'
require_relative 'key_generator'
require_relative 'offsets'

class Decryptor
  attr_accessor :message, :date
  attr_reader :final_rotations, :key, :final_message

  def initialize
    @key = [1,2,3,4,5]
    @offset = Offsets.new('111111', @key)
    @final_rotations = @offset.master_rotations
    @date = @offset.date
    collect_message
    decrypt
    write_encrypted_message
    puts "Created #{ARGV[1]} using the key #{@key.join} and the date of #{@date}"
  end

  def collect_message
    @input = File.open("#{ARGV[0]}", "r")
    @message = File.read(@input)
  end

  def write_encrypted_message
    @output = File.open("#{ARGV[1]}", "w")
    @output.write(@results)
    @output.close
    @final_message = @results
  end

  def decrypt(string = @message, rotation = @final_rotations)
    @results = []
    @letters = string.split("")
    @letters.map.with_index do |letter, index|
      @results << encrypt_letter(letter, (-1 * rotation[index % 4]))
    end
    @results = @results.join
  end

  def encrypt_letter(letter, rotation)
    character_map = CharacterMap.new(rotation)
    cipher_for_rotation = character_map.cipher
    cipher_for_rotation[letter]
  end

end
