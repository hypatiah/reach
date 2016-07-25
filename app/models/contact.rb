class Contact < ActiveRecord::Base
    # Remember to create a migration!
    belongs_to :user
    has_many :reaches, class_name: 'Reach'

    validates :user_id, :name, :phone, presence: true
end
