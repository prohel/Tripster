class AddCreatedByColumnToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :created_by, :string
  end
end
