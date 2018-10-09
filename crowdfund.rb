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
    "Project #{@name} has $#{@funding} in funding towards a goal og $#{@targetFunding}."
  end
end

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)

puts project1
puts project2
project1.removeFunds(100)
project2.addFunds(10)
puts project1
puts project2
puts "Project #{project1.name} has a total total funding still needed of $#{project1.targetFunding - project1.funding}"