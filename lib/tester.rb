require_relative 'processor'

class Tester
  def initialize(method, strategy: :recursive)
    @strategy = lookup_strategy(method, strategy).new
  end

  def add(left, right)
    @strategy.add(left, right)
  end

  def solve(size)
    @strategy.solve(size)
  end

  private

  def lookup_strategy(method, strategy)
    Processor.const_get(classify(method)).const_get(classify(strategy))
  end

  def classify(name)
    name.to_s.split('_').map(&:capitalize).join
  end
end
