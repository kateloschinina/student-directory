def get_student_data
end

def input_students
    puts "Please enter the names of the students and their corresponding cohorts",
    "(Note! (1) cohort should be one of the following (with exact spelling): January, February, March, April, May, June, July, August, September, October, November, December",
    "(2) cohort will be authomatically assigned to November if you enter an empty string)"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    puts "Student's name:"
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      # asking for cohort inside the loop not to ask for empty name
      puts "Student's cohort:"
      cohort = gets.chomp
      # if no cohort was entered then default meaning is November
      if cohort.empty?
        cohort = "November"
      end
      until ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"].include? cohort do
        puts "You have mispelled the month of student's cohort, please re-enter: "
        cohort = gets.chomp
        if cohort.empty?
          cohort = "November"
          break
        end
      end
      # add the student hash to the array
      students << {name: name, cohort: cohort.to_sym, hobby: :coding, country_of_birth: :UK, height: :"172"}
      puts "Now we have #{students.count} students"
      # get another name and cohort from the user
      puts "Student's name:"
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
    students = students.sort_by { |k| k[:cohort] }

    while !students[i].nil? do
        # check all requested requrements (starts from letter, length) by default: letter is nil, length is 12
          if ((specific_letter == nil) or (students[i][:name][0].downcase == specific_letter.downcase)) and (students[i][:name].length < specific_length)
          if (i==0) or (students[i][:cohort] != students[i-1][:cohort])
            puts " Cohort: #{students[i][:cohort]}".center(output_width,'.')
          end
          puts  "#{i+1}:"+"Student's name: #{students[i][:name]},".center(output_width-2),
                " student's hobby: #{students[i][:hobby]},".center(output_width),
                " student's country of birth: #{students[i][:country_of_birth]},".center(output_width),
                " student's height: #{students[i][:height]}.".center(output_width),
                ""
            end
        i += 1
    end
end

def print_footer(students, output_width = 86)
  puts "Overall, we have #{students.length} great student#{students.length > 1 ? "s" : ""}.".center(output_width)
end

students = input_students
print_header
specific_letter = "j"
print(students)
print_footer(students)
