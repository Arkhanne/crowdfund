require_relative 'project'

class Fundrequest
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