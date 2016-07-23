class Reach < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :user, :text, :contact

    validates :user_id, :text_id, :contact_id, presence: true
end
