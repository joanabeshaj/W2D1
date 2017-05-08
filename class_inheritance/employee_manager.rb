class Employee

  attr_reader :name, :title, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def boss=(boss)
    unless boss.employees.include?(self)
      @boss = boss
      boss.employees << self
    end
  end

  def bonus(multiplier)
    (self.salary * multiplier)
  end

  protected
  attr_reader :salary
end

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def add_employee(emp_obj)
    unless employees.include?(emp_obj)
      emp_obj.boss = self
    end
  end

  def bonus(multiplier)
    sum = 0
    employees.each do |emp|
      if emp.is_a?(Manager)
        sum += emp.salary
        sum += emp.bonus(multiplier)
      else
        sum += emp.salary
      end
    end

    sum * multiplier
  end


end

# ned = Manager.new( "Ned", "founder", 1000000, nil)
# darren = Manager.new( "Darren", "ta manager", 78000, ned)
