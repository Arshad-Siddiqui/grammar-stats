require 'grammar_stats'

RSpec.describe GrammarStats do
  describe '#percentage_good' do
    it 'Returns 0 when handed nothing' do
      grammar_tracker = GrammarStats.new
      expect(grammar_tracker.percentage_good).to eq 0
    end

    it 'Returns 100 when handed 1 good grammar' do
      grammar_tracker = GrammarStats.new
      grammar_tracker.check('Hello world.')
      expect(grammar_tracker.percentage_good).to eq 100
    end

    it "Returns 0 when handed 1 bad grammar" do
      grammar_tracker = GrammarStats.new
      grammar_tracker.check('hello world')
      expect(grammar_tracker.percentage_good).to eq 0
    end

    it "returns 50 when handed a good and a bad grammar" do
      grammar_tracker = GrammarStats.new
      grammar_tracker.check('hello world')
      grammar_tracker.check('Hello world.')
      expect(grammar_tracker.percentage_good).to eq 50
    end

    it 'returns 75 when handed 3 good 1 bad' do
      grammar_tracker = GrammarStats.new
      grammar_tracker.check('hello world')
      grammar_tracker.check('Hello world.')
      grammar_tracker.check('Hello world.')
      grammar_tracker.check('Hello world.')
      expect(grammar_tracker.percentage_good).to eq 75
    end
  end
end