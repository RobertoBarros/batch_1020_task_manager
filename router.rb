class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch_action(action)
    end
  end

  private

  def print_actions
    puts '-' * 50
    puts "1. List all tasks"
    puts "2. Add new task"
    puts "3. Remove task"
    puts "4. Mark task as done"
    puts '-' * 50
    puts "Enter your action number:"
    puts '-' * 50
  end

  def dispatch_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.mark_as_done
    end
  end
end
