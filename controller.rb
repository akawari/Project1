require 'sinatra'
require_relative './database.rb'

#Main redirect:
get '/' do
    redirect '/students'
end

#index:
get '/students' do
    db = DBHandler.new
    @all_students = db.all
    @all_enrolled = db.all_enrolled
    @all_graduated = db.all_graduated
    erb :application do
        erb :index
    end
end

get '/students/enrolled' do
    db = DBHandler.new
    @all_enrolled = db.all_enrolled
    erb :application do
        erb :index
    end
end

get '/students/graduated' do
    db = DBHandler.new
    @all_graduated = db.all_graduated
    erb :application do
        erb :index
    end
end

#new:
get '/students/new' do
  erb :application do
      erb :new
    end
end

#create:
post '/students' do
   db = DBHandler.new
   db.create(params[:fname], params[:lname], params[:email], params[:major], params[:status])
   redirect to '/students'
end

#show:
get '/students/:id' do
    id = params[:id].to_i
    db = DBHandler.new
    @student_item = db.get(id)
    erb :application do
        erb :show
    end
end

#edit:
get '/students/:id/edit' do
   id = params[:id].to_i
   db = DBHandler.new
   @student_item = db.get(id)
   erb :application do
       erb :edit
    end
end

#update:
patch '/students/:id' do
    id = params[:id].to_i
    db = DBHandler.new
    db.update(id, params[:fname], params[:lname], params[:email], params[:major], params[:status])
    redirect to '/students'
end

#delete:
get '/students/:id/delete' do
    id = params[:id].to_i
    db = DBHandler.new
    db.destroy(id)
    redirect to '/students'
end