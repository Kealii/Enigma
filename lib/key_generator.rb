class KeyGenerator

  attr_reader :key, :a_key

  def initialize(key = [1, 2, 3, 4, 5])
    @key = key
  end

  def generate_key
    @key = (11111..99999).to_a.sample
  end
end
