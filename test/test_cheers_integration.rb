require 'minitest/autorun'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_help_message
    skip
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_two_valid_arguments
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday is in 127 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  # Scenarios discussed in class:
  # 0 args -> help message
  # 1 valid arg
  # 1 invalid arg
  # 2 args
  #   * valid + valid
  #   * valid + invalid
  #   * invalid + valid
  #   * invalid + invalid
  #
  # Valid Names:
  #    * Regular name
  #    * Name with hyphens
  # Invalid Names:
  #   * birthday instead of name
  #   * all non-word characters
  #   * "" (empty string)
  #   * "  " (whitespace)
  # Valid Months:
  #   * m/dd (8/25)
  #   * mm/dd (08/25)
  #   * birthdays that already happened this year
  #   * birthdays that haven't happened yet this year
  # Invalid Months:
  #   * dd/mm (25/08)
  #   * dd/mm/yy (08/25/2015)
end
