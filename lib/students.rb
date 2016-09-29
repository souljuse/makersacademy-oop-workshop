require 'date'
require 'yaml'
require_relative 'student'
#first thing to do is creating a class with readable attribute
#it should inport the info from the yml and turn a hash with something more easy to read
#like a class.
#so the hash  get passed in the Student.new
students = YAML.load_file('students.yml')
students.map! {|hash| Student.new(hash)}

def full_name(first_name, last_name)
  "#{first_name} #{last_name}"
end

def rating_for_student(full_name, year_of_birth, height)
  letters_in_name = full_name.scan(/\w/).count
  year_of_birth / (height + letters_in_name)
end

def student_name(student)
  full_name = full_name(student.first_name, student.last_name)
end

def year_of_birth(student)
  year_of_birth = (student.year_of_birth).year
end

students.sort! do |a, b|
  full_name_a = student_name(a)
  full_name_b = student_name(b)
  year_of_birth_a = year_of_birth(a)
  year_of_birth_b = year_of_birth(b)

  rating_a = rating_for_student(full_name_a, year_of_birth_a, a.height)
  rating_b = rating_for_student(full_name_b, year_of_birth_b, b.height)

  rating_a <=> rating_b
end

students.each do |student|
  full_name = student_name(student)
  year_of_birth = year_of_birth(student)
  rating = rating_for_student(full_name, year_of_birth, student.height)

  puts "#{full_name}, rating: #{rating}"
end
