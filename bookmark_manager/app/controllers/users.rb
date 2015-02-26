get '/users/new' do
  @user = User.new
  erb :new_user
end

post '/users' do
  @user = User.new(:email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to '/'
  else
    flash[:errors] = @user.errors.full_messages
    erb :"new_user"
  end
end