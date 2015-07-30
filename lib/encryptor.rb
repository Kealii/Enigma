require_relative 'character_map'
require_relative 'key_generator'
require_relative 'offsets'

# Encryptor.new(test_input_file,
#               "output_file",
#               Offsets.string_date(ODate.parse('2015-02-03'))
#              )

class Encryptor
  attr_accessor :message, :date
  attr_reader :final_rotations, :key, :results

  def initialize(date, message)
    @keygen = KeyGenerator.new
    @key    = @keygen.generate_key
    @offset = Offsets.new(date, @key)
    @final_rotations = @offset.master_rotations
    @date = @offset.date
    @message = message
    encrypt
  end

  def encrypt(string = @message, rotation = @final_rotations)
    @results = []
    @letters = string.split("")
    @letters.map.with_index do |letter, index|
      @results << encrypt_letter(letter, rotation[index % 4])
    end
    @results = @results.join
  end

  def encrypt_letter(letter, rotation)
    character_map = CharacterMap.new(rotation)
    cipher_for_rotation = character_map.cipher
    cipher_for_rotation[letter]
  end
end


if $PROGRAM_NAME == __FILE__
  input_file  = ARGV[0]
  output_file = ARGV[1]

  message     = File.read("./files/" + input_file)
  date        = Offsets.string_date Time.now
  e           = Encryptor.new(date, message)
  File.write ("./files/" + ARGV[1]), e.results
  puts "Created #{output_file} using the key #{e.key.join} and the date of #{e.date}"
end
