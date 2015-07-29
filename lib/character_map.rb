class CharacterMap
  attr_reader :cipher

  def initialize(rotation)
    letters = ('a'..'z').to_a
    numbers = ['0','1','2','3','4','5','6','7','8','9']
    characters = [" ",".",","]
    character_map = []
    character_map = letters + numbers + characters
    rotated_characters = character_map.rotate(rotation)
    @cipher = Hash[character_map.zip(rotated_characters)]
   end
end
