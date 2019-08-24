RSpec.describe Processor::Add do
  describe '#add' do
    subject { Tester.new(:add, strategy: strategy).add(left, right) }

    context 'with recursive strategy' do
      let(:strategy) { :recursive }
      context 'with plain number' do
        let(:left) { (1..10).to_a.sample }
        let(:right) { (100..200).to_a.sample }
        it { is_expected.to eq left+right }
      end

      context 'wuth array on the left hand side' do
        let(:right) { (100..200).to_a.sample }
        context 'with nested array' do
          let(:left) { [[1, [4, 5]], [[4, 5], [1, 3]]] }
          it { is_expected.to eq right + left.flatten.sum }
        end
      end

      context 'with array on the both sides' do
        let(:left) { [[1, [4, 5]], [[4, 5], [1, 3]]] }
        let(:right) { [[[10, 20], [4, 15]], [[4, [5, 3]], [11, 3]]] }
        it { is_expected.to eq right.flatten.sum + left.flatten.sum }
      end
    end

    context 'with non-recursive strategy' do
      let(:strategy) { :non_recursive }
      context 'with plain number' do
        let(:left) { (1..10).to_a.sample }
        let(:right) { (100..200).to_a.sample }
        it { is_expected.to eq left+right }
      end

      context 'wuth array on the left hand side' do
        let(:right) { (100..200).to_a.sample }
        context 'with nested array' do
          let(:left) { [[1, [4, 5]], [[4, 5], [1, 3]]] }
          it { is_expected.to eq right + left.flatten.sum }
        end
      end

      context 'with array on the both sides' do
        let(:left) { [[1, [4, 5]], [[4, 5], [1, 3]]] }
        let(:right) { [[[10, 20], [4, 15]], [[4, [5, 3]], [11, 3]]] }
        it { is_expected.to eq right.flatten.sum + left.flatten.sum }
      end
    end
  end
end
