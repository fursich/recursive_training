RSpec.describe Processor::Hanoi do

  describe '#solve' do
    subject { Tester.new(:hanoi, strategy: strategy).solve(size) }

    context 'with recursive strategy' do
      let(:strategy) { :recursive }

      context 'with a disk' do
        let(:size) { 1 }
        let(:move) { [[1, 0, 2]] }
        it { is_expected.to match move }
      end

      context 'with 2 disks' do
        let(:size) { 2 }
        let(:move) { [[1, 0, 1], [2, 0, 2], [1, 1, 2]] }
        it { is_expected.to match move }
      end

      context 'with 3 disks' do
        let(:size) { 3 }
        let(:move) { [[1, 0, 2], [2, 0, 1], [1, 2, 1], [3, 0, 2], [1, 1, 0], [2, 1, 2], [1, 0, 2]] }
        it { is_expected.to match move }
      end

      context 'with 4 disks' do
        let(:size) { 4 }
        let(:move) { [[1, 0, 1], [2, 0, 2], [1, 1, 2], [3, 0, 1], [1, 2, 0], [2, 2, 1], [1, 0, 1], [4, 0, 2], [1, 1, 2], [2, 1, 0], [1, 2, 0], [3, 1, 2], [1, 0, 1], [2, 0, 2], [1, 1, 2]] }
        it { is_expected.to match move }
      end
    end

    context 'with non_recursive strategy' do
      let(:strategy) { :non_recursive }

      context 'with a disk' do
        let(:size) { 1 }
        let(:move) { [[1, 0, 2]] }
        it { is_expected.to match move }
      end

      context 'with 2 disks' do
        let(:size) { 2 }
        let(:move) { [[1, 0, 1], [2, 0, 2], [1, 1, 2]] }
        it { is_expected.to match move }
      end

      context 'with 3 disks' do
        let(:size) { 3 }
        let(:move) { [[1, 0, 2], [2, 0, 1], [1, 2, 1], [3, 0, 2], [1, 1, 0], [2, 1, 2], [1, 0, 2]] }
        it { is_expected.to match move }
      end

      context 'with 4 disks' do
        let(:size) { 4 }
        let(:move) { [[1, 0, 1], [2, 0, 2], [1, 1, 2], [3, 0, 1], [1, 2, 0], [2, 2, 1], [1, 0, 1], [4, 0, 2], [1, 1, 2], [2, 1, 0], [1, 2, 0], [3, 1, 2], [1, 0, 1], [2, 0, 2], [1, 1, 2]] }
        it { is_expected.to match move }
      end
    end
  end
end
