class AddUser < ActiveRecord::Migration
  def self.up
    user = Users.new(:username=>"sirajadmin",:password=>"hell0123!", :confirm_password=>"hell0123!", :email=>"siraj@fli.com",user_type=>"Admin")
    user.save
  end

  def self.down
  end
end
