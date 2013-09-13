require_relative 'config/application'

def list_tasks 
 Task.all.select { |task|
   puts "[#{task.completed}] #{task.id}: #{task.text}" }
end

if ARGV[0] == 'add'
  task = Task.new(:text => ARGV[1..-1].join(' '))
  task.save
end

if ARGV[0] == 'delete'
  Task.delete(ARGV[1])
end

if ARGV[0] == 'complete'
  Task.update(ARGV[1],:completed => 'X')
  list_tasks
end

if ARGV[0] == 'uncomplete'
  Task.update(ARGV[1],:completed => ' ')
  list_tasks
end

list_tasks if ARGV[0] == 'list'
