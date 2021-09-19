class CreateVenues < ActiveRecord::Migration[6.1]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :venues, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.text :short_description
      t.text :long_description
      t.text :address
      t.decimal :lat, precision: 8, scale: 6
      t.decimal :lng, precision: 9, scale: 6

      t.timestamps
    end
  end
end
