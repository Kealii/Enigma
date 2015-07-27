class KeyGenerator
  def generate_key
    key = (0..99999).to_a.sample
    key = key.to_s
    key = key.rjust(5, '0')
  end
end
