class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "25x25>" }, :default_url => "http://godlessmom.com/wp-content/uploads/2014/09/480px-Question-mark-50x50.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :caption, presence: true
  validates :name, presence: true
  validates :photo, presence: true
  validates_with AttachmentPresenceValidator, :attributes => :photo
  validates_with AttachmentSizeValidator, :attributes => :photo, :less_than => 1.megabytes
end
