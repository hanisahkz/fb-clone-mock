class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :name, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true 
  validates :password_confirmation, presence: true
    #still have issues with password formatting
  
  validates :password, length: { in: 6..20 }
  # validates :password, format: {with: /\A[-a-zA-z-0-9._ ]{6,20}/}
  validates :password, confirmation: true

  has_many :statuses, dependent: :destroy
  has_many :likes, dependent: :destroy

  attr_accessor :password, :password_confirmation

end







# validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, multiline:true, message: "must contain valid address" }  