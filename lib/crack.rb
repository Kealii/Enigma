class Crack

  attr_accessor :crack_key

  def initialize
    @crack_key = 0
  end

  def format_key
    @crack_key.to_s.rjust(5, '0')
  end

end
