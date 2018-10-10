class Project
  attr_reader :funding, :targetFunding
  attr_accessor :name

  def initialize(name, initialFunding=0, targetFunding)
    @name = name
    @funding = initialFunding
    @targetFunding = targetFunding
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
