class User < ActiveRecord::Base
    # Remember to create a migration!
    has_many :texts, :contacts, :reaches

    validates :username, :email, :password_hash, presence: true

    validates :username, :email, uniqueness: true
end
