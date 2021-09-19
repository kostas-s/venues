class CreateTimeslots < ActiveRecord::Migration[6.1]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :timeslots, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :venue, null: false, foreign_key: true, type: :uuid
      t.time :start_time
      t.time :end_time
      t.integer :day

      t.timestamps
    end
  end
end
