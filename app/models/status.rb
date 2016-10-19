class Status < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  validates :title, length: {minimum: 8, too_short: "title is too short"}
  validates :content, length: {minimum: 10, too_short: "content is too short"}

  belongs_to :user
  has_many :likes, dependent: :destroy
end


