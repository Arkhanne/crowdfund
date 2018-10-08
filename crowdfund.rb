project1 = "ABC"
project2 = "LMN"
project3 = "XYZ"
funds1 = 1000
funds2 = 700
funds3 = 4000

puts "Project".ljust(30) + "Funds"
puts "".ljust(35, "-")
puts "#{project1.ljust(34 - funds1.to_s.length, ".")}#{funds1}$"
puts "#{project2.ljust(34 - funds2.to_s.length, ".")}#{funds2}$"
puts "#{project3.ljust(34 - funds3.to_s.length, ".")}#{funds3}$"