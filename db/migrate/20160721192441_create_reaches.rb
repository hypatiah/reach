class CreateReaches < ActiveRecord::Migration
    def change
        create_table :reaches do |t|
            t.integer :user_id
            t.string :contact_name
            t.string :contact_phone
            t.string :text
            t.string :label
            t.boolean :main_reach

            t.timestamps(null: false)
        end
    end
end
