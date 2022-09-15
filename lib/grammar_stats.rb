class GrammarStats
  def initialize
    @checks = []
  end

  def check(text)
    @checks.push text.match? /^[A-Z][\w\s]*[?.!]$/
    @checks[-1]
  end

  def percentage_good
    if @checks.length == 0 then return 0 end
    passes = 0
    fails = 0
    @checks.each do |result|
      result ? passes += 1 : fails += 1     
    end
    (passes.to_f / (passes.to_f + fails.to_f)) * 100
  end
end