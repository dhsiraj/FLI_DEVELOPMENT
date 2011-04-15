class Comment < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  #has_one :user
end
