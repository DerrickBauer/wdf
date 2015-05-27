require 'bcrypt'
puts "Enter Desired Password:"
password = gets
salt = BCrypt::Engine.generate_salt
encrypted_password = BCrypt::Engine.hash_secret(password, salt)
puts "Encrypted Password:#{encrypted_password}"