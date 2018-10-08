class Project
  def initialize(name, initialAmount=0, targetAmount)
    @name = name
    @amount = initialAmount
    @targetAmount = targetAmount
  end

  def addFunds(amount)
    @amount += amount
    puts "Project #{@name} got some funds!"
  end

  def removeFunds(amount)
    @amount -= amount
    puts "Project #{@name} lost some funds!"
  end

  def to_s
    "Project #{@name} has $#{@amount} in funding towards a goal og $#{@targetAmount}."
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
