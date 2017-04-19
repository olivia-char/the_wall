class User < ActiveRecord::Base
	has_many :messages 
	has_many :comments
	validates :name, length: { minimum: 5 }, presence: true
end
