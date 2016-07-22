class Reach < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :user
    belongs_to :text
    belongs_to :contact
end
