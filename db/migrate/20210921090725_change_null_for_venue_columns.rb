class ChangeNullForVenueColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_null :venues, :name, false
    change_column_null :venues, :short_description, false
    change_column_null :venues, :long_description, false
    change_column_null :venues, :address, false
    change_column_null :venues, :lat, false
    change_column_null :venues, :lng, false
  end
end
