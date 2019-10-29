def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_with_criteria(students)
  # puts "Enter letter you want filter by"
  # letter = gets.chomp.capitalize
  # students.each_with_index do |student, index|
  #   puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  # end
  count = 1
  while !students.empty?
    student = students.pop
    puts "#{count} #{student[:name]} (#{student[:cohort]} cohort)"
    count += 1
  end
end
def print_footer(number)
  puts "Overall, we have #{number} great students"
end
def input_students
  puts "Please enter the names and information of the students"
  puts "To finish enter an empty name"
  # create an empty array
  students = []
  # get the first name
  puts "Please enter the name of the student"
  # while the name is not empty, repeat this code
  loop do
    name = gets.chomp
    break if name.empty?
    #Ask user to input the additional information of the student
    puts "Please enter the hobby of the student"
    hobby = gets.chomp
    puts "Please enter the height of the student"
    height = gets.chomp
    puts "Please enter the country of birth of the student"
    country_of_birth = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, height: height, country_of_birth: country_of_birth}
    puts "Now we have #{students.count} students"
    # ask for another name from the user
    puts "Please enter the name of the student"
  end
  # return the array of students
  students
end
#nothing happens until we call the methods
students = input_students
student_count = students.count
print_header
print_with_criteria(students)
print_footer(student_count)
