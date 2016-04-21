class Photopost < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  def already_likes?(post)
    self.likes.where(:all, :conditions => ['post_id = ?', post.id]).size > 0
  end
end
