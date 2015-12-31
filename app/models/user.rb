class User < ActiveRecord::Base
	attr_accessor :password
	before_create :encrypt_password

	def encrypt_password
		self.encrypted_password = BCrypt::Password.create(self.password)
	end

	def authenticate(password)
		BCrypt::Password.new(self.encrypted_password) == password
	end
end