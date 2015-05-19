require 'csv'

class Todo

  def initialize(file_name)
    @file_name = file_name
    @todos = CSV.read('todos.csv', headers: true)
  end


  def start
    loop do
      system('clear')

      puts "---- TODO.rb ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1)finish homework  exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = gets.chomp.to_i
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

  def view_todos
    puts "Unfinished"
    print "Completed"
  end

  private
  def get_input
    gets.chomp
  end

  def save!
    File.write(@file_name, @todos.to_csv)
  end
end
