

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
  database: 'p2pc-1_development' )

get '/' do
  # Look in app/views/index.erb
  @note
  erb :all
end

post '/' do
  p params
  # user = User.create(username: params[:username], email: params[:emal])
  @note = Note.create(notetext: params[:notetext])
  redirect '/notes'
end

get '/notes' do
  p Note.all
  @notes = Note.all.sort
  erb :all
end

get '/update/:id' do
  @note = Note.find(params[:id])
  erb :update
end

post '/update/:id' do
  p params
  @note = Note.find(params[:id])
  @note.update_attributes(notetext: params[:notetext])
  redirect '/notes'
end

post '/delete/sure/:id' do
  @note = Note.find(params[:id])
  erb :delete
end

post '/delete/:id' do
  Note.find(params[:id]).destroy
  redirect '/notes'
end