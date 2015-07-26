require_relative 'character_map'
require_relative 'key_generator'


class Encryptor

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
