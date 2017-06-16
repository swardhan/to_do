require 'sinatra'

class Todo
  attr_accessor :task, :done, :urgent, :important
  def initialize task
    @task = task
    @done = false
    @urgent = false
    @important = false
  end
end

tasks = []

get '/' do
  data = Hash.new
  data[:tasks] = tasks

  erb :index, locals: data
end

post '/add' do
  puts params
  task = params[:task]
  todo = Todo.new task
  task.strip!
  unless task.empty?
  tasks << todo
  end
  return redirect '/'
end

post '/delete' do

  new_arr = []
  task_del = params["task1"]
  tasks.each do |todo|
    if todo.task != task_del
      new_arr << todo
    end
  end
  tasks = new_arr

  return redirect '/'

end


post '/done' do
   task = params[:task]
   tasks.each do |todo|
     if todo.task == task
       todo.done = !todo.done
     end
   end
   return redirect '/'
end

post '/urgent' do
   task = params[:task]
   tasks.each do |todo|
    if todo.task == task
       todo.urgent = !todo.urgent
    end
   end
   return redirect '/'
end

post '/important' do
   task = params[:task]
   tasks.each do |todo|
    if todo.task == task
       todo.important = !todo.important
    end
   end
   return redirect '/'
end
