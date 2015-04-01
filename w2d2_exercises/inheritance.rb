class Employee

  attr_accessor :name, :title, :salary, :boss, :employees

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary = name, title, salary
    @boss = boss
  end

  # ALTERNATIVE METHOD
  #
  # def bonus(multiplier)
  #   salary * multiplier
  # end
end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss = nil, employees = [])
    super(name, title, salaray, boss)
    @employees = employees
  end

  def add_employee(employee)
    @employees << employee
  end

  # ALTERNATIVE METHOD
  #
  # def bonus(multiplier)
  #   sum_empl_salaries = salary * multiplier
  #
  #   employees.each { |employee| sum_empl_salaries += employee.bonus(multiplier) }
  #
  #   sum_empl_salaries
  # end

  def bonus(multiplier)
    sum_empl_salaries = salary * multiplier

    employees.each do |employee|
      if employee.is_a?(Manager)
        sum_empl_salaries += employee.bonus(multiplier)
      else
        sum_empl_salaries += employee.salary
      end
    end

    sum_empl_salaries
  end

end
