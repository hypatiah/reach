class Reach < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :user
    belongs_to :text
    belongs_to :contact

    validates :user_id, :text_id, :contact_id, :label, presence: true
end
