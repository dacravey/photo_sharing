class User < ActiveRecord::Base

  has_many :photos
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  validates :avatar, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes

  has_attached_file :avatar, :styles => { :medium => "500x500>", :thumb => "40x40>" }, :default_url => "http://godlessmom.com/wp-content/uploads/2014/09/480px-Question-mark-50x50.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    def encrypt_password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    def self.authenticate(email, password)
      user = User.where(email: email).first
      if
        user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
  end
end
