class Reach < ActiveRecord::Base
    belongs_to :user

    validates :user_id, :text, :contact_phone, presence: true
end
