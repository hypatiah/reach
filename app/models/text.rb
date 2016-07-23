class Text < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :user
    has_many :reaches

    validates :user_id, :description, presence: true
end
