class User < ActiveRecord::Base
    # Remember to create a migration!
    has_many :texts
    has_many :contacts
    has_many :reaches, class_name: 'Reach'

    validates :username, :email, :password_hash, presence: true

    validates :username, :email, uniqueness: true
end
