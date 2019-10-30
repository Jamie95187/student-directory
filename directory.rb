def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_with_criteria(students, cohort)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]}, #{student[:hobby]}, #{student[:height]}cm, #{student[:country_of_birth]})" if student[:cohort] == cohort
  end
end
def print_footer(number)
  puts "Overall, we have #{number} great students"
end
def input_students
  puts "Please enter the names and information of the students"
  puts "To finish enter stop as the name"
  # create an empty array
  students = []
  # get the first name
  question("name & cohort")
  # while the name is not empty, repeat this code
  loop do
    name_and_cohort = [gets.chomp, gets.chomp]
    break if name_and_cohort.first == "stop"
    name_and_cohort[0] = "N/A" if name_and_cohort.first.empty?
    name_and_cohort.last << "november" if name_and_cohort.last.empty?
    #Ask user to input the additional information of the student
    question("hobby")
    hobby = gets.chomp
    question("height")
    height = gets.chomp
    question("country of birth")
    country_of_birth = gets.chomp
    # add the student hash to the array
    students << {name: name_and_cohort.first, cohort: name_and_cohort.last.to_sym, hobby: hobby, height: height, country_of_birth: country_of_birth}
    puts "Now we have #{students.count} students"
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
#nothing happens until we call the methods
students = input_students
student_count = students.count
print_header
puts "Enter which cohort you want to print by"
cohort = gets.chomp.to_sym
print_with_criteria(students, cohort)
print_footer(student_count)
