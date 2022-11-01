require_relative 'task'
require_relative 'repository'
require_relative 'controller'
require_relative 'view'
require_relative 'router'

repository = Repository.new('tasks.csv')



controller = Controller.new(repository)

router = Router.new(controller)

router.run
