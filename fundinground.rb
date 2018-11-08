# frozen_string_literal: true

require_relative 'project'
require_relative 'die'
require_relative 'pledgecollection'

#
# FundingRound
#
module FundingRound
  @die = Die.new

  def self.die
    @die
  end

  def self.take_round(project)
    number_rolled = @die.roll

    if (number_rolled % 2).zero?
      project.remove_funds(100)
    else
      project.add_funds(100)
    end

    project.add_pledge(PledgeCollection.random)
  end
end
