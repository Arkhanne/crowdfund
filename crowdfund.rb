project1 = "ABC"
project2 = "LMN"
project3 = "XYZ"
funds1 = 1000
funds2 = 700
funds3 = 4000
project_column_name = "Project"
funds_column_name = "Funds"
offset_columns = 30

def list_title(column1_name, column2_name, offset)
  total_offset = offset + column2_name.length

  puts column1_name.ljust(offset) + column2_name
  puts "".ljust(offset + column2_name.length, "-")
  total_offset
end

def project_list(project, funds=0, offset)
  "#{project.ljust(offset - 1 - funds.to_s.length, ".")}#{funds}$"  
end

offset = list_title(project_column_name, funds_column_name, offset_columns)
puts project_list(project1, funds1, offset)
puts project_list(project2, funds2, offset)
puts project_list(project3, funds3, offset)