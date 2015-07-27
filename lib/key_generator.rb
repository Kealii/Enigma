class KeyGenerator

  attr_reader :key, :a_key

  def initialize(key = [1, 2, 3, 4, 5])
    @key = key
  end

  def generate_key
    @key = (11111..99999).to_a.sample
  end

  def a_key
    a_key = @key[0..1].join.to_i
  end

  def b_key
    b_key = key[1..2].to_i
  end

  def c_key
    c_key = key[3..4].to_i
  end

  def d_key
    d_key = key[4..5].to_i
  end

end
