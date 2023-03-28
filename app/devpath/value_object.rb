class ValueObject
  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date, @end_date = start_date, end_date
  end

  def each
    (start_date..end_date).each { |date| yield date }
  end

  def to_s
    "#{start_date} - #{end_date}"
  end
  def ==(other)
    other.start_date == start_date && other.end_date == end_date
  end

  alias eql? ==
end

# usage:
# date_range = ValueObject.new(Date.new(2019, 1, 1), Date.new(2019, 1, 31))
# date_range2 = ValueObject.new(Date.new(2019, 1, 1), Date.new(2019, 1, 31))
# date_range3 =  ValueObject.new(Date.new(2019, 1, 1), Date.new(2019, 2, 1))
# date_range == date_range2 # => true
# date_range == date_range3 # => false