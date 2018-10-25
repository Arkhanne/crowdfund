require_relative "fundrequest"

project1 = Project.new("LMN", 3000, 500)
project2 = Project.new("XYZ", 75, 25)

startup = Fundrequest.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)
startup.requestFunding(3)