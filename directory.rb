@students = [] # an empty array accessible to all methods

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_students_with_filter(cohort)
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]}, #{student[:hobby]}, #{student[:height]}, #{student[:country_of_birth]})" if student[:cohort] == cohort
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
def input_students
  puts "Please enter the names and information of the students"
  puts "To finish enter stop as the name and return twice"
  question("name & cohort")
  loop do
    name_and_cohort = [gets.rstrip, gets.rstrip]
    break if name_and_cohort.first == "stop"
    name_and_cohort[0] = "N/A" if name_and_cohort.first.empty?
    name_and_cohort.last << "november" if name_and_cohort.last.empty?
    question("hobby")
    hobby = gets.rstrip
    question("height")
    height = gets.rstrip + "cm"
    question("country of birth")
    country_of_birth = gets.rstrip
    @students << {name: name_and_cohort.first, cohort: name_and_cohort.last.to_sym, hobby: hobby, height: height, country_of_birth: country_of_birth}
    @students.size > 1 ? (puts "Now we have #{@students.count} students") : (puts "Now we have 1 student")
    question("name")
  end
end
# helper method to ask user for input
def question(information)
  puts "Please enter the #{information} of the student"
end
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
def show_students
  print_header
  if !@students.empty?
    puts "Enter which cohort you want to print by"
    cohort = gets.rstrip.to_sym
    print_students_with_filter(cohort)
    print_footer
  else
    puts "There are no students in the directory!"
  end
end
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end
def save_students
  # open the file for wrtiing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:height], student[:country_of_birth]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, hobby, height, origin = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height, country_of_birth: origin}
    end
    file.close
  end

interactive_menu
