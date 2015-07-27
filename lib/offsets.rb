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
    date_key.flatten.map(&:to_i).last(4)
  end



end
