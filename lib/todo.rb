require 'csv'

class Todo

  def initialize(file_name)
    @file_name = file_name
    @todos = CSV.read(@file_name, headers: true)
  end


  def start
    loop do
      system('clear')

      puts "---- TODO.rb ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = gets.chomp.to_s
      case action
      when 1 then finish homework
      when 2 then add_todo
      when 3 then mark_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def todos
    @todos
  end

  def add_todo
    puts "Name of Todo > "
    get_input = "make this test pass"
    @todos << "#{'make this test pass'},no\n"
    save!
  end

  def view_todos
    puts "Unfinished"
    @todos.map.with_index do |row, index|
      print "#{index + 1}) #{row['name']}"
    end
    print "Completed"
  end

def mark_todo
  puts "Which todo have you finished?"
  get_input = "finish homework"
  @todos << "#{'finish homework'},yes\n"
end
#need to make it read yes/true instead of no...crap.

  private
  def get_input
    gets.chomp
  end

  def save!
    File.write(@file_name, @todos.to_csv)
end
end
