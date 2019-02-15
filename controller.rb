require 'sinatra'

get '/' do
    redirect '/students'
end

#The array:
students = %w(burger fries shake coffee)

#index
get '/students' do
    @all_students = students
    erb :application do
      erb :index
    end
end

#new
get '/students/views/new' do
    erb :application do
        erb :new
    end
end

#show
get '/students/:id' do
    @student_info = students[params[:id].to_i]
    erb :application do
      erb :show
    end
end 

#edit
get '/students/:id/edit' do
   @student_info = students[params[:id].to_i]
   @id = params[:id].to_i
   erb :application do
       erb :edit
    end
end

#update
patch '/students/:id' do 
    students[params[:id].to_i] = params[:newstudent]
    @all_students = students
    erb :application do
        erb :index
    end
end

#create
post '/students' do
   students << params[:newstudent]
   @all_student = student
   erb :application do
       erb :index
    end
end

#destroy
get '/student/:id/delete' do
    students.delete_at(params[:id].to_i)
    @all_students = students
    erb :application do
        erb :index
    end
end