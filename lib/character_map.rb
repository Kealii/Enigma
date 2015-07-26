class CharacterMap
  attr_reader :cipher

  def initialize(rotation)
    letters = ('a'..'z').to_a
    numbers = (0..9).to_a
    characters = [" ",".",","]
    character_map = []
    character_map = letters + numbers + characters
    rotated_characters = character_map.rotate(rotation)
    @cipher = Hash[character_map.zip(rotated_characters)]
   end
end
