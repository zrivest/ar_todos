require_relative '../config/application'
require_relative '../app/models/task'
require_relative '../todo'

require 'csv'

def todos
  todo_list = []
  CSV.foreach('db/todos.csv','r') { |row| todo_list << Task.create(:text => row[0]) }
end

todos
