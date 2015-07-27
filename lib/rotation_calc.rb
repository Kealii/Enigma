require_relative 'offsets'
require_relative 'key_generator'

class Rotation_calc

@keygen = KeyGenerator.new

@offset = Offsets.new
@offset.offset_date
@offset.extract_date_key


  def a_rotation
    @offset.a_offset + @keygen.a_key
  end

end
