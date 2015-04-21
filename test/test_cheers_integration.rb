require 'minitest/autorun'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_that_tests_run
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end
end
