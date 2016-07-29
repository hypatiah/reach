class Reach < ActiveRecord::Base
    belongs_to :user

    validates :user_id, :text, :contact_phone, :label, presence: true
end
