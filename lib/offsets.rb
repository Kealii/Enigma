class Offsets

  attr_reader :date

  def initialize(date = "111111", key = [1, 2, 3, 4, 5])
    @date = date
    @key = key
  end

  def offset_date
    @date = Time.now.strftime("%d%m%y")
  end

  def square_date
    @date = date.to_i ** 2
  end

  def extract_date_key
    date_key = []
    date_key << square_date.to_s.chars
    @extraction = date_key.flatten.map(&:to_i).last(4)
  end

  def a_rotations
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
end
