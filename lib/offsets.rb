require_relative '../lib/key_generator'

class Offsets
  attr_accessor :key
  attr_reader :date

  def initialize(date = "111111", key = [1, 2, 3, 4, 5])
    @key = key
    @date = date
  end

  def real_date
    @date = Time.now.strftime("%d%m%y")
  end

  def square_date
    # real_date
    @square_date = @date.to_i ** 2
  end

  def extract_date_key
    square_date
    date_key = []
    date_key << @square_date.to_s.chars
    @extraction = date_key.flatten.map(&:to_i).last(4)
  end

  def a_rotations
    extract_date_key
    @extraction[0].to_i + @key[0..1].join.to_i
  end

  def b_rotations
    @extraction[1].to_i + @key[1..2].join.to_i
  end

  def c_rotations
    @extraction[2].to_i + @key[2..3].join.to_i
  end

  def d_rotations
    @extraction[3].to_i + @key[3..4].join.to_i
  end

  def master_rotations
    rotations = []
    rotations << a_rotations
    rotations << b_rotations
    rotations << c_rotations
    rotations << d_rotations
  end

end
