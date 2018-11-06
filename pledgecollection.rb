Pledge = Struct.new(:name, :amount)

#
# Pledge mangement
#
module PledgeCollection
  PLEDGES = [
    Pledge.new(:bronze, 50),
    Pledge.new(:silver, 75),
    Pledge.new(:gold, 100)
  ].freeze

  def self.random
    PLEDGES.sample
  end
end
