class Contact < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :users
    has_many :reaches
end
