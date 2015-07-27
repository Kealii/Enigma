class Offsets

  attr_reader :date

  def initialize(date = "010101")
    @date = date
  end

  def offset_date
    date = Time.now.strftime("%d%m%y")
  end

  # def square_date
  #   datesquared = date.to_i ** 2
  # end

end
