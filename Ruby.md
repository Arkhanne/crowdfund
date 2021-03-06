# RUBY
* Switch between Ruby versions
    ```
    > rvm system
    > rvm 2.5.1
    > rvm default
    ```
* IRB stands for "interactive Ruby" and is a  tool to interactively executeRuby expressions read from the standard input
    ```
    > irb   --> to launch IRB
    > exit  --> to exit IRB (or Ctrl-D)
    ```
* Documentation
    ```
    > ri String
    > ri String.center
    > ri center
    > ri reverse
    ```
## Numbers ans Strings
```
> 4.99 + 1.99
=> 6.98

> 25 / 2
=> 12

> 25 / 2.0
=> 12.5
```
```Ruby
puts 'Mikey\'s favourite movie is ' + movie
puts "Mikey's favourite movie is #{movie}"

puts movie + ' has a rank of ' + rank.to_s
puts "#{movie} has a rank of #{rank}"
```
## Variables and Objects
```
> movie = "Goonies"
=> "Goonies"
> movie.length
=> 7
> movie.reverse
=> "seinooG"
> movie.center(10)
=> " Goonies  "
> movie.ljust(30,'.')
=> "Goonies......................."

> rank = 8
=> 8
> rank.to_s
=> "8"
> rank.to_f
=> 8.0
> rank.to_i
=> 8
> rank * 2
=> 16
> rank.*(2)
=> 16

> current_time = Time.now
=> 2018-10-05 19:03:01 +0200
> current_time.hour
= 19
> current_time.min
=> 3

> movie = ""
=> ""
> movie.empty?
=> true
> movie = "Goonies"
=> "Goonies"
> movie.start_with?("G")
=> true
> movie.reverse! <-- it changes the variable value
=> "seinooG"
> movie = "goonies"
=> "goonies"
> movie.capitalize.ljust(30, '.')
=> "Goonies......................."
```
## Methods
```Ruby
def welcome
  puts "Howdy!"
end

def welcome(name)
  puts "Howdy, #{name}!"
end

def welcome(name = "Partner")
  puts "Howdy, #{name}!"
end

def welcome(name, age)
  puts "Howdy, #{name}!"
  puts "You don't look #{age}"
end
```
## Classes
```Ruby
class Movie
  def initialize(title, rank = 0)
    @title = title.capitalize
    @rank = rank
  end
  def to_s
    "#{@title} has a rank of #{@rank}"
  end
end

movie1 = Movie.new("goonies", 10)
puts movie1
puts movie1.inspect #prints out what's inside the movie1 object
```
## Attributes
```Ruby
attr_reader :title

attr_writer :title

attr_accessor :title
```
## Arrays
```
> seats = ['kermit', 'fozzie', 'gonzo']
=> ["kermit","fozzie","gonzo"]
> seats[3]
=> nil

> seats = %w(kermit fozzie gonzo)
=> ["kermit","fozzie","gonzo"]

> seats = []
=> []
> seats = Array.new
=> []
> seats.push('kermit')
=> ["kermit"]
> seats << 'gonzo'
=> ["kermit","gonzo"]
> seats.pop
=> "gonzo"
> seats
=> ["kermit"]
```
```Ruby
movies.each do |movie|
  movie.thumbs_up
  puts movie
end
```
## Separate Source Files
```Ruby
require_relative 'movie'

class Playlist
  #...#
end
```
```Ruby
if __FILE__ == $0
  #...#
end
```
## Unit Testing
```
> gem install rspec
> rpec movie_spec.rb
> rspec movie_spec.rb -f d
> rspec . -f d
```
```Ruby
# movie_spec.rb

require_relative 'movie'

describe Movie do
  it 'has a capitalized title' do
    movie = Movie.new("goonies", 10)
    expect(movie.title).to eql("Goonies")
  end
end
```
```Ruby
# movie_spec.rb

require_relative 'movie'

describe Movie do
  before do
    $strout = StringIO.new
    @initial_rank = 10
    @movie = Movie.new("goonies", initial_rank)
  end
  
  it 'has a capitalized title' do
    expect(@movie.title).to eql("Goonies")
  end
  
  context "created with a default rank" do
    before do
      @movie = Movie.new("goonies")
    end  

    it 'has a rank of 0' do
      expect(@movie.rank).to eql(0)
    end
  end
end      
```
### To force a method to return a value
```Ruby
it 'skips the movie if a medium number is rolled' do
  @playlist.stub(:roll_die).and_return(3)
  @playlist.play

  expect(@movie.rank).to eql(@initial_rank - 1)
end
```
>RSpec 3
>```Ruby
>allow(@playlist).to receive(:roll_die).and_return(3)
>```
>.
## Conditionals
```Ruby
if movie.rank >=1 10
  puts "Hit"
else
  puts "Flop"
end
```
```Ruby
puts "Hit" if movie.rank >= 10
```
```Ruby
class Movie
  
  #...#
  
  def hit?
    @rank >= 10
  end
  
  def status
    hit? ? "Hit" : "Flop"
  end
  
  #...#

end
```
```Ruby
if number_rolled < 3
  #...#
elseif number_rolled < 5
  #...#
else
  #...#
end
```
```Ruby
case
when number_rolled < 3
  #...#
when number_rolled < 5
  #...#
else
  #...#
end
```
```Ruby
case number_rolled
when 1..2
  #..#
when 3..4
  #..#
else
  #..#
end
```
## Modules
```Ruby
module WaldorfAndStatler
  def self.roll_die
    rand(1..6)
  end
end
```
## Blocks
```Ruby
3.times { puts "Echo" }

10.times do |number|
  puts "#{number} situps"
  puts "#{number} pushups"
  puts "#{number} chinups"
end

1.upto(10) do |number|
  puts "#{number} situps"
  puts "#{number} pushups"
  puts "#{number} chinups"
end
```
```Ruby
movies.each do |movie|
  movie.thumbs_up
  puts movie
end
```
```
> numbers = (1..10).to_a
=> [1,2,3,4,5,6,7,8,9,10]
```
```Ruby
numbers.select do |number|
  number > 5
end

# is the same that:

numbers.select do |number| number > 5 end

# and the same that:

numbers.select { |number| number > 5 }

# and the same that:

numbers.select { |n| n > 5 }
```
```
> numbers = (1..10).to_a
=> [1,2,3,4,5,6,7,8,9,10]
> numbers.select { |n| n > 5 }
=> [6,7,8,9,10]
> evens = numbers.select { |n| n.even? }
=> [2,4,6,8,10]
> odds = numbers.select { |n| n.odd? }
=> [1,3,5,7,9]
> evens, odds = numbers.partition { |n| n.even? }
=> [[2,4,6,8,10],[1,3,5,7,9]]
> evens
=> [2,4,6,8,10]
> odds
=> [1,3,5,7,9]
> numbers.reduce { |sum, n| sum + n }
=> 55
> numbers.reduce(:+)
=> 55
> numbers.reduce(:*)
=> 3628800
```
```Ruby
names = %w(Goonies Ghostbusters Goldfinger)
puts names.sort
puts names.sort_by { |w| w.length }
```
```
> numbers = [24, 13, 8, 65]
=> [24,13,8,65]
> numbers.sort
=> [8, 13, 24, 65]
> numbers.sort { |a,b| b <=> a }
=> [65, 24, 13, 8]
> numbers.any? { |n| n > 20 }
=> true
> numbers.detect { |n| n > 20 }
=> 24
numbers.map { |n| n * 2 }
[48, 26, 16, 130]
```
## Symbols
>Name something in code
```Ruby
attr_reader :health     # attribute named "health"

attr_accessor :name     # attribute named "name"

find(:all)              # option named "all"

if color == :red        # color named "red"
  #...#
end
```
## Structs
```Ruby
Snack = Struct.new(:name, :carbs)

popcorn = Snack.new('popcorn', 20)
puts popcorn.name
puts popcorn.carbs
```
```Ruby
Snack = Struct.new(:name, :carbs)

module SnackBar
  SNACKS = [
    Snack.new(:popcorn, 20),
    Snack.new(:candy, 15)
  ]

  def self.random
    SNACKS.sample
  end
end

puts SnackBar::SNACKS
snack = SnackBar.random
puts snack.name
```
## Hashes
```
> snacks_carbs = {:candy => 15, :pretzel => 10, :soda => 5}
=> {:candy=>15, :pretzel=>10, :soda=>5}
> snack_carbs[:candy]
=> 15
> snack_carbs[:pretzel]
=> 10

> snack_carbs = {candy: 30, pretzel: 100, soda: 50}
=> {:candy=>30, :pretzel=>100, :soda=>50}
> snack_carbs.keys
=> [:candy, :pretzel, :soda]
> snack_carbs.values
=> [30, 100, 50]

> snack_carbs = {}
=> {}
> snack_carbs = Hash.new
=> {}
> snack_carbs[:candy] = 15
=> 15
> snack_carbs [:candy]
=> 15
```
```Ruby
snack_carbs.each do |name, carbs|
  puts "#{name} has #{carbs} carbs"
end

snack_carbs.each { |key, value| puts "#{key} has #{value} carbs" }
```
```
> snack_carbs = {}
=> {}
> snack_carbs[:soda]
=> nil

> snack_carbs = Hash.new(0)
=> {}
> snack_carbs[:soda]
=> 0
```
## Custom Iterators
```Ruby
def once
  puts "Before yield"
  yield
  puts "After yield"
end

once { puts "Running your block" }
```

```Ruby
def three_times
  puts "Ready"
  yield(1)
  puts "Set"
  yield 2
  puts "Go!"
  yield 3
end

three_times { |number| puts number" }
```

```Ruby
def compute
  if block_given?
    puts yield
  else
    puts "Does not compute!"
  end
end

compute { 3.14 }
```

```Ruby
numbers = (1..10).to_a
puts numbers.select { |n| n.even? }

# Same with iterators
numbers = (1..10).to_a

def my_select(array)
  results = []
  array.each do |element|
    results << element if yield(element)
  end
  results
end

puts my_select(numbers) { |n| n.even? }
```
## Input/Output
```Ruby
loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    playlist.play(answer.to_i)
  when 'quit', 'exit'
    playlist.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
```
```Ruby
File.open('movies.csv') do |file|
  file.each_line do |line|
    puts line
  end
end
```
```Ruby
File.readlines('movies.csv').each do |line|
  puts line
end
```
```Ruby
playlist.load(ARGV.shift || 'movies.csv')
```
```Ruby
def save(to_file = 'movie_rankings.csv')
  File.open(to_file, 'w') do |file|
    @movies.sort.each do |movie|
      file.puts "#{movie.title},#{movie.rank}"
    end
  end
end
```
## Inheritance
```Ruby
class Movie3D < Movie
end
```
```
> Movie3D.superclass
=> Movie
> Movie3D.ancestors
=> [Movie3D, Movie, Object, Kernel, BasicObject]
```
```Ruby
class Movie3D < Movie
  def initialize(title, rank, wow_factor)
    super(title, rank)
    @wow_factor = wow_factor
  end

  def thumbs_up
    # @rank += (1 * @wow_factor)
    @wow_factor.times { super }
  end
  end

  def show_effect
    puts 'Wow! ' * @wow_factor
  end
end
```
## Mixins
```Ruby
module Rankable
  def thumbs_up
    puts "#{@title} got a thumbs up!"
  end
end

class Movie
  include Rankable

  def initialize(title, rank)
    @title = title
    @rank = rank
  end
end

class Song
  include Rankable

  def initialize(title, rank)
    @title = title
    @rank = rank
  end
end

movie = Movie.new('Goonies', 10)
movie.thumbs_up
song = Song.new('Ruby Baby', 10)
song.thumbs_up
```
## Distribution
```Ruby
module MovieSystem
  VERSION = 1.0

  def self.info
    puts "Movie system version #{VERSION}"
  end

  class Player
  end
end

module GameSystem
  VERSION = 2.0

  def self.info
    puts "Game system version #{VERSION}"
  end

  class Player
  end
end

puts MovieSystem::VERSION
puts MovieSystem.info
puts MovieSystem::Player.new

puts GameSystem::VERSION
puts GameSystem.info
puts GameSystem::Player.new
```
```Ruby
require_relative '../lib/flicks/playlist'
require_relative '../lib/flicks/movie3d'

playlist = Flicks::Playlist.new('Kermit')
default_movie_file = File.join(File.dirname(__FILE__), 'movies.csv')
playlist.load(ARGV.shift || default_movie_file)require_relative '../lib/flicks/playlist'
require_relative '../lib/flicks/movie3d'

playlist = Flicks::Playlist.new('Kermit')
default_movie_file = File.join(File.dirname(__FILE__), 'movies.csv')
playlist.load(ARGV.shift || default_movie_file)
```
```Ruby
#flicks.gemspec
Gem::Specification.new do |s|
  s.name        = "flicks"
  s.version     = "1.0.0"
  s.author      = "The Pragmatioc Studio"
  s.email       = "support.pragmaticstudio.com"
  s.summary     = "Plays and reviews movies"
  s.description = "File.read(File.join(File.dirname(__FILE), 'README'))"
  s.homepage    = "http://pagmaticstudio.com"
  
  s.files       = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files  = Dir["spec/**/*"]
  s.executables = [ 'flicks' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
```
```
$ gem build flicks.gemspec
$ gem install flicks-1.0.0.gem
$ gem list flicks -d
$ flicks
$ gem uninstall flicks
```