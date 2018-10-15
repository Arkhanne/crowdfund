class Project
  attr_reader :funding, :targetFunding
  attr_accessor :name

  def initialize(name, targetFunding, initialFunding=0)
    @name = name
    @funding = initialFunding
    @targetFunding = targetFunding
  end

  def funded?
    @funding >= @targetFunding
  end

  def warned?
    @funding <= 0
  end

  def addFunds(amount)
    @funding += amount
    puts "Project #{@name} got some funds!"
  end

  def removeFunds(amount)
    @funding -= amount
    puts "Project #{@name} lost some funds!"
  end

  def to_s
    "Project #{@name} has $#{@funding} in funding towards a goal of $#{@targetFunding}."
  end
end
