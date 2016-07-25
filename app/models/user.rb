class User < ActiveRecord::Base
    has_many :reaches, class_name: 'Reach'

    validates :username, :email, :password_hash, presence: true

    validates :username, :email, uniqueness: true
end
