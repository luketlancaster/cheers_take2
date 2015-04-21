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

  def test_one_valid_name
    skip
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!
EOS
    assert_equal expected, output
  end

  def test_one_valid_name_with_hyphen
    skip
    output = `./cheers Abby-Sue`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Give me a... S
Give me an... U
Give me an... E
Abby-Sue’s just GRAND!
EOS
    assert_equal expected, output
  end

  def test_one_valid_birthday
    skip
    output = `./cheers 03/15`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS

    assert_equal expected, output
  end

  def test_one_arg_all_non_word_characters
    skip
    output = `./cheers $@^@`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS

    assert_equal expected, output
  end

  def test_one_arg_empty_string
    skip
    output = `./cheers ""`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS

    assert_equal expected, output
  end

  def test_two_valid_arguments
    skip
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

  def test_two_invalid_arguments
    skip
    output = `./cheers 2344 afsae`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS

    assert_equal expected, output
  end

  def test_two_args_valid_name_invalid_birthday
    skip
    output = `./cheers Luke we/23`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
I couldn't understand that. Could you give that to me in mm/dd format next time?
EOS

    assert_equal expected, output
  end

  def test_two_args_invalid_name_valid_birthday
    skip
    output = `./cheers #25 12/23`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS

    assert_equal expected, output
  end

  # Scenarios discussed in class:
  # 2 args
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
