require_relative 'offsets'
require_relative 'key_generator'

class Rotation_calc

  def initialize
    @keygen = KeyGenerator.new
    @offset = Offsets.new
    # @offset.offset_date
    @offset.extract_date_key
  end



  def a_rotation
    @offset.a_offset + @keygen.a_key
  end

end
