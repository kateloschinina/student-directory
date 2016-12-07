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
      students << {name: name, cohort: :November, hobby: :coding, country_of_birth: :UK, height: :"172"}
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
    i = 0
    while !students[i].nil? do
        #puts "st = #{students[i]}"
        if ((specific_letter == nil) or (students[i][:name][0].downcase == specific_letter.downcase)) and (students[i][:name].length < specific_length)
          puts  "#{i+1}: Student name: #{students[i][:name]},",
                " Student cohort: #{students[i][:cohort]},",
                " Student hobby: #{students[i][:hobby]},",
                " Student country of birth: #{students[i][:country_of_birth]},",
                " Student height: #{students[i][:height]}."
        end
        i += 1
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
