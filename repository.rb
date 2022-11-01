require 'csv'

class Repository
  def initialize(csv_filename)
    @csv_filename = csv_filename
    @tasks = load_csv
  end

  def add_task(task)
    @tasks << task
    save_csv
  end

  def all
    @tasks
  end

  def remove_task(index)
    @tasks.delete_at(index)
    save_csv
  end

  def mark_as_done(index)
    task = @tasks[index]
    task.done!
    save_csv
  end

  private

  def load_csv
    tasks = []

    CSV.foreach(@csv_filename) do |row|
      description = row[0]
      done = row[1] == 'true'
      new_task = Task.new(description)
      new_task.done! if done
      tasks << new_task
    end

    tasks
  end

  def save_csv
    CSV.open(@csv_filename, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end
    end
  end
end




# repository = Repository.new

# t1 = Task.new('Aprender Ruby')
# repository.add_task(t1)

# t2 = Task.new('Happy Hour de sexta-feira')
# repository.add_task(t2)

# repository.all.each do |task|
#   puts "#{task.description}"
# end

# repository.remove_task(1)
# repository.mark_as_done(0)
