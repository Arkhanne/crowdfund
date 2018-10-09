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

class Funding
  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def requestFunding
    puts "There are #{@projects.size} projects in total:"
    @projects.each do |project|
      puts project
    end

    @projects.each do |project|
      project.addFunds(100)
      puts project
    end
  end
end

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)

startup = Funding.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)
startup.requestFunding