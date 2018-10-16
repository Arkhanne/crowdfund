require_relative 'fundinground'

class Fundrequest
  attr_reader :projects

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
      FundingRound.takeRound(project)
      puts project
    end
  end
end