require 'CSV'
@students = [] # an empty array accessible to all methods

def add_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym, hobby: :coding, country_of_birth: :UK, height: :"172"}
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    add_to_students(line[0], line[1].to_sym)
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv" # assigning the default value
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def get_cohort_info
  puts "Student's cohort:"
  cohort = STDIN.gets.chomp
  # if no cohort was entered then default meaning is November
  if cohort.empty?
    cohort = "November"
  end
  # checks that cohort is a month (12 possible months)
  until ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"].include? cohort do
    puts "You have mispelled the month of student's cohort, please enter on of the following months (spelling matters) - January, February, March, April, May, June, July, August, September, October, November, December, or empty string to assign it to November: "
    cohort = STDIN.gets.chomp
    # user can enter empty input to assign cohort to November (default)
    if cohort.empty?
      return cohort = "November"
    end
  end
  return cohort
end

def get_student_name
  puts "Student's name:"
  return STDIN.gets.chomp
end

def input_students
    puts "Please enter the names of the students and their corresponding cohorts",
    "(Note! (1) cohort should be one of the following (with exact spelling): January, February, March, April, May, June, July, August, September, October, November, December",
    "(2) cohort will be authomatically assigned to November if you enter an empty string)"
    puts "To finish, just hit return twice"
    # get the first name
    name = get_student_name
    # while the name is not empty, repeat this code
    while !name.empty? do
      # asking for cohort inside the loop not to ask for empty name
      cohort = get_cohort_info
      # add the student hash to the array
      add_to_students(name, cohort)
      puts "Now we have #{@students.count} student#{@students.length > 1 ? "s" : ""}"
      # get another name from the user
      name = get_student_name
    end
end

def print_header(output_width = 86)
    puts "The students of Villians Academy".center(output_width)
    puts "-----------------".center(output_width)
end

def print_students_list(output_width = 86, specific_letter = nil, specific_length = 30)
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
  puts "3. Save the list tp students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students(filename = "students.csv")
  # open the file for writing
  CSV.open(filename, "w") do |file| # iterate over the array of students
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end

def save_the_list
  puts "If you want to use you file for saving, please enter the name of the file. Otherwise please enter empty string, and we will use \"students.csv\" as default"
  file = gets.chomp
  if !file.empty?
    save_students(file)
  else
    save_students
  end
  puts "We have saved all the students to the file. Please choose what you would like to do next."
end

def load_the_list
  puts "If you want to use you file for loading, please enter the name of the file. Otherwise please enter empty string, and we will use \"students.csv\" as default"
  file = gets.chomp
  until File.file?(file) or file.empty?
    puts "This file doesn't exist in the directory, please enter another name or empty string, and then we will use \"students.csv\" as default"
    file = gets.chomp
  end
  if !file.empty?
    load_students(file)
  else
    load_students
  end
  puts "We have loaded all the students from the file. Please choose what you would like to do next."
end


def process(selection)
  case selection
  when "1"
    #input the students
    input_students
    puts "You have successfully finished students input. Please choose what you would like to do next."
  when "2"
    #show the students
    show_students
    puts "Here are all the students we have. Please choose what you would like to do next."
  when "3"
    save_the_list
  when "4"
    load_the_list
  when "9"
    exit # in this case the program will terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def interative_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interative_menu

=begin
students = input_students
string_size = 86
if students.empty?
  puts "There is no students in Villians Academy this year...".center(string_size)
else
  print_header(string_size)
  #specific_letter = "j"
  print(students, string_size)
  print_footer(students, string_size)
end
=end
