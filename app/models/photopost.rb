class Photopost < ActiveRecord::Base
  acts_as_votable
  belongs_to :user


  def already_likes?(post)
    self.likes.where(:all, :conditions => ['post_id = ?', post.id]).size > 0
  end
end
