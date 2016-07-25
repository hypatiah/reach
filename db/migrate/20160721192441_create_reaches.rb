class CreateReaches < ActiveRecord::Migration
    def change
        create_table :reaches do |t|
            t.integer :user_id
            t.integer :text_id
            t.integer :contact_id
            t.string :label

            t.timestamps(null: false)
        end
    end
end
