class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    # 1. Pegar todas as tasks do repositório
    tasks = @repository.all

    # 2. Mandas a view exibir as tasks
    @view.display(tasks)
  end

  def create
    # 1. Perguntar a descrição da task
    description = @view.ask_description

    # 2. Criar um novo objeto task
    new_task = Task.new(description)

    # 3. Adicionar a nova task ao repository
    @repository.add_task(new_task)
  end

  def destroy
    # 1. Mostrar todas as tasks
    list

    # 2. Perguntar o index da task para remover
    index = @view.ask_index

    # 3. Mandar o repository remover a task pelo index
    @repository.remove_task(index)
  end

  def mark_as_done
    # 1. mostrar todas as tasks
    list

    # 2. Perguntar o index da task
    index = @view.ask_index

    # 3. Mandar o repository marcar a task como done
    @repository.mark_as_done(index)

  end

end
