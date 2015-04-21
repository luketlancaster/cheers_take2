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

  def test_one_arg_empty_string_with_whitespace
    skip
    output = `./cheers " "`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS

    assert_equal expected, output
  end


  def test_valid_name_mmyy_birthday
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

  def test_myy_birthday
    skip
    output = `./cheers Abby 8/25`
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

  def test_birthday_already_passed
    skip
    output = `./cheers Abby 3/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday was 26 days ago! Happy belated birthday!
EOS
    assert_equal expected, output
  end

  def test_birthday_instead_of_name
    skip
    output = `./cheers 3/35 3/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_invalid_date_ddmm
    skip
    output = `./cheers Abby 15/03`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_invalid_date_ddmmyy
    skip
    output = `./cheers Abby 15/03/1987`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

end
