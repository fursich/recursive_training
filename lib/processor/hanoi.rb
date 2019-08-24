module Processor
  module Hanoi
    class Recursive
      def solve(size)
        @state = [(1..size).to_a, [], []]
        p @state

        @move = []
        solve_recursively(size, 0, 2, 1)
        @move
      end

      private

      def solve_recursively(n, from, to, work)
        if n == 1
          record_move(from, to)
          return
        end

        solve_recursively(n-1, from, work, to)
        record_move(from, to)
        solve_recursively(n-1, work, to, from)
      end

      def record_move(from, to)
        target = @state[from].shift
        @state[to].unshift(target)
        @move << [target, from, to]
        p @state
      end
    end

    class NonRecursive
      def solve(size)
        @state = [(1..size).to_a, [], []]
        p @state

        @move = []
        solve_non_recursively(size, 0, 2, 1)
        @move
      end

      private

      def solve_non_recursively(n, from0, to0, work0)
        from, to, work = from0, to0, work0
        stack = []
        loop do
          if n == 1
            record_move(from, to)
            return if stack.size == 0

            n, from, to, work = stack.pop
            next
          end
          n -= 1
          stack.push([n, work, to, from])
          stack.push([1, from, to, work])
          from, to, work = from, work, to
        end
      end

      def record_move(from, to)
        target = @state[from].shift
        @state[to].unshift(target)
        @move << [target, from, to]
        p @state
      end
    end
  end
end
