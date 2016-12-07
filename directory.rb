def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villians Academy"
    puts "-----------------"
end

def print(students, specific_letter = nil, specific_length = 12)
    students.each_with_index do |student, i|
        if ((specific_letter == nil) or (student[:name][0].downcase == specific_letter.downcase)) and (student[:name].length < specific_length)
          puts "#{i+1}: #{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end

def print_footer(students)
  puts "Overall, we have #{students.length} great students."
end

students = input_students
print_header
specific_letter = "j"
print(students)
print_footer(students)
