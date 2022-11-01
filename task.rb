class Task
  attr_reader :description

  def initialize(description)
    @description = description
    @done = false
  end

  def done?
    @done
  end

  def done!
    @done = true
  end
end

# t1 = Task.new('Limpar a casa')
# t1.description # => 'Limpar a casa'
# t1.done? # => false
# t1.done!
# t1.done? # => true
