require_relative 'character_map'
require_relative 'key_generator'
require_relative 'offsets'

class Decryptor
  attr_accessor :message, :date
  attr_reader :final_rotations, :key, :results

  def initialize
    @key = ARGV[2].split("")
    @date = ARGV[3].to_s
    @offset = Offsets.new(@date, @key)
    @final_rotations = @offset.master_rotations
    collect_message
    decrypt
    write_encrypted_message
    puts "Created #{ARGV[1]} using the key #{@key.join} and the date of #{@date}"
  end

  def collect_message
    file = "./files/" + ARGV[0].to_s
    @input = File.open("#{file}", "r")
    @message = File.read(@input)
  end

  def write_encrypted_message
    file = "./files/" + ARGV[1].to_s
    @output = File.open("#{file}", "w")
    @output.write(@results)
    @output.close
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

d = Decryptor.new
