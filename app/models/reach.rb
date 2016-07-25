class Reach < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :user

    validates :user_id, :text, :contact_phone, presence: true
end
