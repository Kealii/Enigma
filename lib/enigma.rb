require_relative 'offsets'
require_relative 'key_generator'

class Enigma

  attr_accessor :message, :final_message

  def collect_message
    @input = File.open("#{ARGV[0]}", "r")
    @message = File.read(@input)
  end

  def output_message
    @output = File.open("#{ARGV[1]}", "w")
    @output.write(@message)
    @output.close
    @final_message = @message
    puts "Created #{@output} using #{@input}"

  end

  def encrypt(string, rotation)
    letters = string.split("")
    results = letters.collect {|x| encrypt_letter(x, rotation)}
    results.join
  end

  def decrypt(string, rotation)
    letters = string.split("")
    results = letters.collect {|x| encrypt_letter(x, ( -1 * rotation))}
    results.join
  end

  def encrypt_letter(letter, rotation)
    character_map = CharacterMap.new(rotation)
    cipher_for_rotation = character_map.cipher
    cipher_for_rotation[letter]
  end

end

e = Enigma.new
e.collect_message
e.output_message
