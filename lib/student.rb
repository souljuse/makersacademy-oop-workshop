class Student
  attr_reader :first_name, :last_name, :date_of_birth, :height
  def initialize(data)
    #I espect a hash to be passed so data is the hash
    @first_name = data['first_name']
    @last_name = data['last_name']
    @date_of_birth = Date.parse(data['date_of_birth'])
    @height = data['height']
  end

  def year_of_birth
    date_of_birth.year
  end

  def full_name(first_name, last_name)
    "#{first_name} #{last_name}"
  end

end
