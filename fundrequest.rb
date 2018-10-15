require_relative 'project'
require_relative 'die'

class Fundrequest
  attr_reader :die
  attr_reader :projects

  def initialize(name)
    @name = name
    @die = Die.new
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
      number_rolled = die.roll

      if number_rolled % 2 == 0
        project.removeFunds(100)
      else
        project.addFunds(100)
      end

      puts project
    end
  end
end