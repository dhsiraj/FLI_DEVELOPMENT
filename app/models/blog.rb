class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comment #, :conditions => { :color => "green" }

end
