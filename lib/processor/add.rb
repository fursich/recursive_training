module Processor
  module Add
    class Recursive
      def add(left, right)
        l = left.is_a?(Array) ? add(left[0], left[1]) : left
        r = right.is_a?(Array) ? add(right[0], right[1]) : right
        l + r
      end
    end

    class NonRecursive
      ON_CALCULATION = :on_calculation

      def add(left0, right0)
        result = nil
        left = [left0]
        right = [right0]

        loop do
          if left.length == 0 && right.length == 0
            return result
          end

          if left.last == ON_CALCULATION
            left.pop
            left << result
          elsif right.last == ON_CALCULATION
            right.pop
            right << result
          end

          if left.last.is_a? Numeric
            if right.last.is_a? Numeric
              result = left.pop + right.pop
            else
              r = right.pop
              right << ON_CALCULATION
              left << r[0]
              right << r[1]
            end
          else
            l = left.pop
            left << ON_CALCULATION
            left << l[0]
            right << l[1]
          end
        end
      end
    end
  end
end
