class User < ActiveRecord::Base
    include BCrypt

    has_many :reaches, class_name: 'Reach'

    validates :username, :email, :password_hash, presence: true

    validates :username, :email, uniqueness: true

    def password
        @password ||= BCrypt::Password.new(password_hash)
  end

    def password=(new_password)
        @password = BCrypt::Password.create(new_password)
        self.password_hash = @password
    end

    def self.authenticate(email, password)
        @user = User.find_by(email: email)
        @user if @user && @user.password == password
    end
end
