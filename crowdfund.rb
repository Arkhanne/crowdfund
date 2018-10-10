require_relative "fundrequest"

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)

startup = Fundrequest.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)
startup.requestFunding