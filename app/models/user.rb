class User < ActiveRecord::Base
    # Remember to create a migration!
    has_many :texts
    has_many :contacts
    has_many :reaches
end
