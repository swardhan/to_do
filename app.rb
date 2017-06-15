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

t1 = Todo.new "First"
t2 = Todo.new "Second"
t3 = Todo.new "Thrid"

tasks << t1
tasks << t2
tasks << t3

get '/' do
  data = Hash.new
  data[:tasks] = tasks

  erb :index, locals: data
end

post '/add' do
  puts params
  task = params[:task]
  todo = Todo.new task
  tasks << todo
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
