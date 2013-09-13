require_relative '../config/application'
require_relative '../app/models/task'
require_relative '../todo'

require 'faker'

def random_todos
  5.times do
    Task.create :text => Faker::Lorem.sentence(word_count= 4, supplement = false, random_words_to_add = 6)
  end
end

p random_todos
