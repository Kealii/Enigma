class KeyGenerator
  attr_reader :key, :a_key

  def initialize(key = [1, 2, 3, 4, 5])
    @key = key
  end

  def generate_key
    @key = (00000..99999).to_a.sample
    @final_key = @key.to_s.split("")
  end
end
