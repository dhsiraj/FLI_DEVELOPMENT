class AddUser < ActiveRecord::Migration
  def self.up
    user = User.new(:username=>"sirajadmin",:password=>"hell0123!", :password_confirmation=>"hell0123!", :email=>"siraj@fli.com",:user_type=>"Admin")
    user.save
  end

  def self.down
  end
end
