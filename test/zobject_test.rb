require 'helper'

class TestZuoraClient < Test::Unit::TestCase
  
  def test_zobject_convert_date
    # Converts dates to PST
    april_fourth_pst = DateTime.new(2012,4,1, 0, 0, 0, "-0800")
    # Make sure all these are converted to April 4th 00:00:00 PST
    dates = [
      Date.new(2012, 4, 1),
      DateTime.new(2012, 4, 1, 0, 0, 0, "-0500"),
      DateTime.new(2012, 4, 1, 23, 59, 59, "-0500"),
      DateTime.new(2012, 4, 1, 0, 0, 0, "-0000"),
      DateTime.new(2012, 4, 1, 23, 59, 59, "-0000"),
      DateTime.new(2012, 4, 1, 0, 0, 0, "-0800"),
      DateTime.new(2012, 4, 1, 23, 59, 59, "-0800")
    ]
    dates.each do |date|
      assert_equal(
        april_fourth_pst, 
        Zuora::ZObject.convert_date(date),
        "#{date.inspect} didn't convert to April 4th PST")
    end
  end

end