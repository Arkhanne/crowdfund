require_relative 'project'
require_relative 'die'

module FundingRound
  @die = Die.new

  def self.die
    @die
  end

  def self.takeRound(project)
    number_rolled = @die.roll

    if number_rolled % 2 == 0
      project.removeFunds(100)
    else
      project.addFunds(100)
    end
  end
end