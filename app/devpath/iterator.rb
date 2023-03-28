class Iterator
  attr_reader :words, :reverse

  def initialize(words, reverse = false)
    @words = words
    @reverse = reverse
  end

  def sort(&block)
    return words.sort.reverse(&block) if reverse

    words.sort(&block)
  end
end

# usage:
# words = %w[foo bar baz]
# iterator = Iterator.new(words)
# iterator.sort # => ["bar", "baz", "foo"]
# iterator = Iterator.new(words, true)
# iterator.sort # => ["foo", "baz", "bar"]
