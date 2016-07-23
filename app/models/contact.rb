class Contact < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :users
    has_many :reaches

    validates :user_id, :name, :phone, presence: true
end
