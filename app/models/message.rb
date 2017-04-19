class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :message, length: { minimum: 10}, presence: true
end
