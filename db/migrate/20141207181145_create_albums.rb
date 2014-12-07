class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :trip, index: true
      t.string :name
      t.references :created_by, index: true

      t.timestamps
    end
  end
end
