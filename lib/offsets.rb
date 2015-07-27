class Offsets

  attr_reader :date

  def initialize(date = "111111")
    @date = date
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

  def a_offset
    @extraction[0].to_i
  end

  def b_offset
    @extraction[1].to_i
  end

  def c_offset
    @extraction[2].to_i
  end

  def d_offset
    @extraction[3].to_i
  end

end
