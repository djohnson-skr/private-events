class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps do |t|
      t.integer :attendee_event_id
      t.integer :attendee_id
      
      t.timestamps
    end
  end
end
