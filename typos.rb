def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # replace "%" with "#"
  students = [] # replace "{}" with "[]"
  # get the first name
  # replace "%" with "#"
  name = gets.chomp # replace space
  # while the name is not empty, repeat this code
  # replace "%" with "#"
  until name.empty? do
  # was "when name.empty"
    # add the student hash to the array
    # replace "%" with "#"
    students << {name: name, cohort: :november}
    # was "students < {:name : name :cohort : :november}"
    puts "Now we have #{students.count} students"
    # was "puts "Now we have #{student.count} students""
    # get another name from the user
    # replace "%" with "#"
    name = gets.chomp
    # was "name = get.chomp"
  end
  # return the array of students
  # replace "%" with "#"
  students
end

def print_header
# replace "-" with "_"
  puts "The students of my cohort at Makers Academy"
  # "puts" instead of "put"
  puts "-------------"
  # replace "``" with """"
end

def print(students)
  students.each do |student|
  # replace "\" with "|", and "s" to students
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    # was "puts '#[student{:name}] (#[student{:cohort}] cohort)'"
  end
end

def print_footer(names) # names in brackets
  puts "Overall, we have #{names.count} great students"
  # "puts" instead of "prints", # added
end


students = input_students
# replace "-" with "_"
print_header
print(students)
# "{}" with "()"
print_footer(students)
# "[]" with "()"
