class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates(:title, presence: true, length: {maximum: 50})
  validates(:content, presence:true, length: {maximum: 1000})
  validates(:user_id, presence:true)
end
