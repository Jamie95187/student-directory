def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_with_filter(students, cohort)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]}, #{student[:hobby]}, #{student[:height]}cm, #{student[:country_of_birth]})" if student[:cohort] == cohort
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
def input_students
  puts "Please enter the names and information of the students"
  puts "To finish enter stop as the name and return twice"
  # create an empty array
  students = []
  # get the first name
  question("name & cohort")
  # while the name is not empty, repeat this code
  loop do
    name_and_cohort = [gets.rstrip, gets.rstrip]
    break if name_and_cohort.first == "stop"
    name_and_cohort[0] = "N/A" if name_and_cohort.first.empty?
    name_and_cohort.last << "november" if name_and_cohort.last.empty?
    #Ask user to input the additional information of the student
    question("hobby")
    hobby = gets.rstrip
    question("height")
    height = gets.rstrip
    question("country of birth")
    country_of_birth = gets.rstrip
    # add the student hash to the array
    students << {name: name_and_cohort.first, cohort: name_and_cohort.last.to_sym, hobby: hobby, height: height, country_of_birth: country_of_birth}
    students.size > 1 ? (puts "Now we have #{students.count} students") : (puts "Now we have 1 student")
    # ask for another name from the user
    question("name")
  end
  # return the array of students
  students
end
# helper method to ask user for input
def question(information)
  puts "Please enter the #{information} of the student"
end

# student_count = students.count
# print_header
# if !students.empty?
#   puts "Enter which cohort you want to print by"
#   cohort = gets.rstrip.to_sym
#   print_with_criteria(students, cohort)
#   print_footer(student_count)
# else
#   puts "There are no students in the directory!"
# end

def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        if !students.empty?
          puts "Enter which cohort you want to print by"
          cohort = gets.rstrip.to_sym
          print_with_filter(students, cohort)
          print_footer(students)
        else
          puts "There are no students in the directory!"
        end
      when "9"
        exit # this will casue the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
