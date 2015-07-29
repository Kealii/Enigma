require 'minitest/autorun'
require 'minitest/pride'
require '../lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_we_can_decrypt_string_with_rotation
    d = Decryptor.new
    assert_equal "hello", d.decrypt("igopp", [1, 2, 3, 4])
  end

  def test_we_can_pass_in_string_to_decrypt
    d = Decryptor.new
    assert_equal "test test test", d.results
  end
end
