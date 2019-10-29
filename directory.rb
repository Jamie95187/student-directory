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
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
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
