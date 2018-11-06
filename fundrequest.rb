require_relative 'fundinground'
require_relative 'pledgecollection'

class Fundrequest
  attr_reader :projects

  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def requestFunding(rounds)
    puts "There are #{@projects.size} projects in total:"
    @projects.each do |project|
      puts project
    end

    pledges = PledgeCollection::PLEDGES
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "    A #{pledge.name} pledge is worth $#{pledge.amount}."
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @projects.each do |project|
        FundingRound.takeRound(project)
        puts project
      end
    end
  end

  def print_name_and_funds(project)
    puts "    #{project.name} (#{project.funding}€)"
  end

  def print_stats
    funded_projects, unfunded_projects = @projects.partition(&:funded?)
 
    puts "\n#{funded_projects.size} funded projects:"
    funded_projects.each do |project|
      print_name_and_funds(project)
    end

    puts "\n#{unfunded_projects.size} unfunded projects:"
    unfunded_projects.each do |project|
      print_name_and_funds(project)
    end

    puts "\nProjects that need contributions:"
    unfunded_projects.sort.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "    #{formatted_name} #{project.outstandingFunds}"
    end
  end
end
