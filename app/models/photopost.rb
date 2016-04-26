class Photopost < ActiveRecord::Base
  acts_as_votable
  belongs_to :user


  has_attached_file :image, styles: {
      medium: '300x300>',
      thumb: '100x100'
  },
    :url => ":s3_domain_url"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def already_likes?(photopost)
    self.likes.where(:all, :conditions => ['photopost_id = ?', photopost.id]).size > 0
  end
end
