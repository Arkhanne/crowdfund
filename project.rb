# frozen_string_literal: true

require_relative 'pledgecollection'

#
# Project
#
class Project
  attr_reader :funding, :target_funding
  attr_accessor :name

  def initialize(name, target_funding, initial_funding = 0)
    @name = name
    @funding = initial_funding
    @target_funding = target_funding
    @pledges = Hash.new(0)
  end

  def funded?
    @funding >= @target_funding
  end

  def warned?
    @funding <= 0
  end

  def add_funds(amount)
    @funding += amount
    puts "    Project #{@name} got some funds!"
  end

  def remove_funds(amount)
    @funding -= amount
    puts "    Project #{@name} lost some funds!"
  end

  def outstanding_funds
    @target_funding - @funding
  end

  def to_s
    "    Project #{@name} has $#{@funding} in funding towards a goal of $#{@target_funding}."
  end

  def <=>(other)
    other.outstanding_funds <=> outstanding_funds
  end

  def add_pledge(pledge)
    @pledges[pledge.name] += pledge.amount
    @funding += pledge.amount
    puts "    Project #{@name} received a #{pledge.name} pledge worth $#{pledge.amount}"
    puts "    Project #{@name}'s pledges: #{@pledges}"
  end

  def each_pledge
    @pledges.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end
end
