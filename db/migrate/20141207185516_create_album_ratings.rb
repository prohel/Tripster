class CreateAlbumRatings < ActiveRecord::Migration
  def change
    create_table :album_ratings do |t|
      t.references :user, index: true
      t.integer :score
      t.references :album, index: true

      t.timestamps
    end
  end
end
