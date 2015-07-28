require_relative 'offsets'
require_relative 'key_generator'
require_relative 'character_map'

class Enigma
  attr_accessor :message, :final_message

  def initialize
    @offset = Offsets.new
    @keygen = KeyGenerator.new
  end

  def collect_message
    @input = File.open("#{ARGV[0]}", "r")
    @message = File.read(@input)
  end

  def output_message
    @output = File.open("#{ARGV[1]}", "w")
    @output.write(@message)
    @output.close
    @final_message = @message
    # puts "Created #{@output} using #{@input}"
  end

  def encrypt(string, rotation)
    @results = []
    @letters = string.split("")
    @letters.map.with_index do |letter, index|
      @results << encrypt_letter(letter, rotation[index%4])
    end
    @results.join
  end

  def decrypt(string, rotation)
    @results = []
    @letters = string.split("")
    @letters.map.with_index do |letter, index|
      @results << encrypt_letter(letter, (-1 * rotation[index%4]))
    end
    @results.join
  end

  def encrypt_letter(letter, rotation)
    character_map = CharacterMap.new(rotation)
    cipher_for_rotation = character_map.cipher
    cipher_for_rotation[letter]
  end

  def rotation
    @offset.extract_date_key
    @offset.master_rotations
  end
end

e = Enigma.new
e.collect_message
e.output_message
