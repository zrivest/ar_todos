require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"


# if ARGV.any?
#   list = List.new('todo.csv')

#   clear_screen!
#   move_to_home!
#   if ARGV[0] == 'list'
#     list.list_all_tasks
#   elsif ARGV[0] == 'add'
#     new_task = []
#     ARGV.each { |word| new_task << word }
#     list.add(new_task.drop(1).join(' '))
#   elsif ARGV[0] == 'delete'
#     list.delete(ARGV[1])
#   end
# end


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


# puts Task.methods - Object.methods
