@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students1.csv"
  puts "4. Load the list from students1.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have selected option 1 to input students."
    input_students
  when "2"
    puts "You have selected option 2 to show the students."
    show_students
  when "9"
    puts "You have selected option 9 to exit.\nGoodBye!"
    exit # this will cause the program to terminate
  when "3"
    puts "You have selected option 3 to save the students to a file."
    ask_for_file == "" ? save_students : save_students(ask_for_file)
  when "4"
    puts "You have selected option 4 to load students from a file."
    ask_for_file == "" ? load_students_from_a_file : load_students_from_a_file(ask_for_file)
  else
    puts "I don't know what you meant, try again"
  end
end

def add_one_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_one_student(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  puts "You have finished inputting students."
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# If no parameter provided use default file "students1.csv"
def save_students(filename = "students1.csv")
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "The students have been saved to the file!"
end

# If no parameter provided use default file "students1.csv"
def load_students_from_a_file(filename = "students1.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name = line.chomp.split(',').first
  cohort = line.chomp.split(',')[1].to_sym
    add_one_student(name, cohort)
  end
  file.close
  puts "You have loaded students from #{filename}!"
end

def load_students_from_command_line
  filename = ARGV.first
  filename = "students1.csv" if filename.nil?
  check_if_file_exits_and_print_result(filename)
end

def check_if_file_exits_and_print_result(filename)
  if File.exists?(filename) # if it exists
    load_students_from_a_file(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def ask_for_file
  puts "Enter the file name you would like save or load from."
  filename = gets.chomp
  filename
end

load_students_from_command_line
interactive_menu
