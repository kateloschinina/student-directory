@students = [] # an empty array accessible to all methods

def input_students
    puts "Please enter the names of the students and their corresponding cohorts",
    "(Note! (1) cohort should be one of the following (with exact spelling): January, February, March, April, May, June, July, August, September, October, November, December",
    "(2) cohort will be authomatically assigned to November if you enter an empty string)"
    puts "To finish, just hit return twice"
    # get the first name
    puts "Student's name:"
    name = gets.slice(0..-2)
    # while the name is not empty, repeat this code
    while !name.empty? do
      # asking for cohort inside the loop not to ask for empty name
      puts "Student's cohort:"
      cohort = gets.slice(0..-2)
      # if no cohort was entered then default meaning is November
      if cohort.empty?
        cohort = "November"
      end
      # checks that cohort is a month (12 possible months)
      until ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"].include? cohort do
        puts "You have mispelled the month of student's cohort, please enter on of the following months (spelling matters) - January, February, March, April, May, June, July, August, September, October, November, December, or empty string to assign it to November: "
        cohort = gets.slice(0..-2)
        # user can enter empty input to assign cohort to November (default)
        if cohort.empty?
          cohort = "November"
          break
        end
      end
      # add the student hash to the array
      @students << {name: name, cohort: cohort.to_sym, hobby: :coding, country_of_birth: :UK, height: :"172"}
      puts "Now we have #{@students.count} student#{@students.length > 1 ? "s" : ""}"
      # get another name and cohort from the user
      puts "Student's name:"
      name = gets.slice(0..-2)
    end
end

def print_header(output_width = 86)
    puts "The students of Villians Academy".center(output_width)
    puts "-----------------".center(output_width)
end

def print_students_list(output_width = 86, specific_letter = nil, specific_length = 12)
    i = 0
    # handy function that sorts hash by cohort - to group them later
    @students.sort_by! { |k| k[:cohort] }

    while !@students[i].nil? do
        # check all requested requrements (starts from letter, length) by default: letter is nil, length is 12
          if ((specific_letter == nil) or (@students[i][:name][0].downcase == specific_letter.downcase)) and (@students[i][:name].length < specific_length)
          # puts cohort name if starts next cohort in sorted hash
          if (i==0) or (@students[i][:cohort] != @students[i-1][:cohort])
            puts " Cohort: #{@students[i][:cohort]}".center(output_width,'.')
          end
          # remaining output
          puts  "#{i+1}:"+"Student's name: #{@students[i][:name]},".center(output_width-2),
                " student's hobby: #{@students[i][:hobby]},".center(output_width),
                " student's country of birth: #{@students[i][:country_of_birth]},".center(output_width),
                " student's height: #{@students[i][:height]}.".center(output_width),
                ""
            end
        i += 1
    end
end

def print_footer(output_width = 86)
  puts "Overall, we have #{@students.length} great student#{@students.length > 1 ? "s" : ""}.".center(output_width)
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    #input the students
    input_students
  when "2"
    #show the students
    show_students
  when "9"
    exit # in this case the program will terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def interative_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interative_menu

=begin
students = input_students
string_size = 86
if students.empty?
  puts "The is no students in Villians Academy this year...".center(string_size)
else
  print_header(string_size)
  #specific_letter = "j"
  print(students, string_size)
  print_footer(students, string_size)
end
=end
