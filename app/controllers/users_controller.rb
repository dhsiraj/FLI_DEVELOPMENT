class UsersController < ApplicationController
  
  
def signin
end

def login
      if @user = User.authenticate(params[:user_name], params[:password])
        session[:user] = @user
        @usertype = @user.user_type
        flash[:message]  = "Login successful"
        #redirect_to_stored
        #format.xml  { render :xml => "Logged in" }
        respond_to do |format|
          #format.html # index.html.erb
          format.js   { render :text => "Logged in" }  
        end
        #redirect_to :action => "welcome"     
        #format.js   { render :nothing => true }       
      else
        respond_to do |format|
          #format.html # index.html.erb
          format.js   { render :text => "error" }  
        end
        #@user = User.new
        #@user.username = params[:user_name]
        #@user.errors[:username] = "par couldnt not login"
        #@user.errors[:passowrd] = "par couldnt not login"
        #format.html { redirect_to(:action => "signin", :notice => 'User was successfully created.') }
        #respond_to do |format|
          #format.html # index.html.erb
         # format.xml  { render :xml => "Logged in" }
        #end

        #redirect_to :action => "login" 
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }  
      end
    
  end
  
  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    respond_to do |format|
     format.js   { render :text => "Logged out" }  
    end
    #format.html { redirect_to(homes_url) }
  end
  
  def checkuserexist
    @user = User.where(:username => params[:username]).first
    respond_to do |format|
      if @user
          format.js   { render :text => "error" }  
      else
        #render :text => "success"
        format.js   { render :text => "success" }  
      end
    end
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    params[:ip_address] = remote.REMOTE_ADDR
    params[:user_type] = "Guest"
    params[:last_login]= Time.now
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   # POST /users
  # POST /users.xml
  def register
    @user = User.new
    params[:ip_address] = request.env['REMOTE_ADDR']
    params[:user_type] = "Guest"
    params[:last_login]= Time.now
    @user.username = params[:user_name]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.email = params[:email]
    @user.ip_address = params[:ip_address]
    @user.user_type = params[:user_type]
    @user.last_login = params[:last_login]
    #@user = User.new(params[:user_name],params[:password],params[:email],params[:ip_address], params[:user_type],params[:last_login])
    respond_to do |format|
      if @user.save
        session[:user] = @user
        format.js   { render :text => "Registration complete." }  
      else
       if @user.errors.any?  
           @user.errors.full_messages.each do |msg|
              puts msg
              
           end
           puts "INSIDE ERRORS"
       end 
       format.js   { render :text => "Registration incomplete, please try again." }  
      end
    end
    
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
