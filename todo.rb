require_relative 'config/application'

def list_tasks 
 Task.all.each_with_index { |task, index|
   puts "[#{task.completed}] #{index + 1}: #{task.text}" }
end

if ARGV[0] == 'add'
  task = Task.new(:text => ARGV[1..-1].join(' '))
  task.save
  list_tasks
end

if ARGV[0] == 'delete'
  task = Task.all[ARGV[1].to_i - 1].destroy
  list_tasks
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

