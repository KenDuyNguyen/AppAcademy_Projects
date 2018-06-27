class Employee 
  attr_reader :salary, :name, :title 
  attr_accessor :boss 
  
  def initialize(name, title, salary, boss=nil) 
    @name = name 
    @title = title
    @salary = salary 
    self.boss = boss  
  end 
  
  def boss=(boss)
    @boss = boss 
    boss.add_subordinate(self) unless boss.nil? 
    boss 
  end 
  
  def bonus(multiplier)
    @salary * multiplier
  end
end 

class Manager < Employee 
  attr_reader :employee, :subordinates
  
  def initialize(name, salary, title, boss=nil)
    super(name, salary, title, boss)
    @subordinates = []
  end
  
  def add_subordinate(subordinate)
    @subordinates << subordinate
    
    subordinate
  end 
  
  def bonus(multiplier)
    self.sub_employees_salary * multiplier
  end 
  
  def sub_employees_salary #gives us salaries of all subordinates 
    total = 0 
    
    self.subordinates.each do |employee| 
      if employee.is_a?(Manager)
        total += employee.salary + employee.sub_employees_salary
      else
        total += employee.salary 
      end 
    end 
    
    total 
  end 
end 


if $PROGRAM_NAME == __FILE__
  ned = Manager.new("ned", "Founder", 1000000, nil)
  darren = Manager.new("darren", "TA Manager", 78000, ned)
  shawna = Employee.new("shawna", "TA", 12000, darren)
  david = Employee.new("david", "TA", 10000, darren)
end 