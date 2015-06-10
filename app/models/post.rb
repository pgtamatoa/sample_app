class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :delete_all
  
  validates(:title, presence: true, length: {maximum: 50})
  validates(:content, presence:true, length: {maximum: 1000})
  validates(:user_id, presence:true)

  paginates_per 5
end
