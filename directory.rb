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

def print_header(output_width = 86)
    puts "The students of Villians Academy".center(output_width)
    puts "-----------------".center(output_width)
end

def print(students, specific_letter = nil, specific_length = 12, output_width = 86)
    i = 0
    while !students[i].nil? do
        #puts "st = #{students[i]}"
        if ((specific_letter == nil) or (students[i][:name][0].downcase == specific_letter.downcase)) and (students[i][:name].length < specific_length)
          puts  "#{i+1}:"+"Student's name: #{students[i][:name]},".center(output_width-2),
                " Student's cohort: #{students[i][:cohort]},".center(output_width,'.'),
                " Student's hobby: #{students[i][:hobby]},".center(output_width,'.'),
                " Student's country of birth: #{students[i][:country_of_birth]},".center(output_width,'.'),
                " Student's height: #{students[i][:height]}.".center(output_width,'.')
        end
        i += 1
    end
end

def print_footer(students, output_width = 86)
  puts "Overall, we have #{students.length} great students.".center(output_width)
end

students = input_students
print_header
specific_letter = "j"
print(students)
print_footer(students)
