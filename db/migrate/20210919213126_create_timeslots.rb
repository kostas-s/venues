class CreateTimeslots < ActiveRecord::Migration[6.1]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :timeslots, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :venue, null: false, foreign_key: true, type: :uuid
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :day, default: 0

      t.timestamps
    end
  end
end
