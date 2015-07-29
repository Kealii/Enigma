require_relative 'character_map'
class Crack

  attr_accessor :crack_key

  def initialize(message = "..end..", crack_key = 0)
    @crack_key = crack_key.to_s.rjust(5, '0')
    @key_crack = @crack_key.to_s.split("")
    @message = message
    @results = ""
  end

  def cracked
    result = @results
    result[-7..-1] == ("..end..")
    @results = result
  end

  def cracker(message = @message, key_crack = @key_crack)
    until cracked
      decrypt(@message, @key_crack)
      key_crack += 1
    end
    @key_crack
  end

  def decrypt(letters = @message, rotation = @key_crack)
    @results = []
    letters = string.split("")
    letters.map.with_index do |letter, index|
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







  # def brute
  #   until cracked
  #     abort if @key == 99999
  #     @crack_key += 1
  #   end
  #   @crack_key
  # end
