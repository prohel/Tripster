class CreateAlbumComments < ActiveRecord::Migration
  def change
    create_table :album_comments do |t|
      t.references :user, index: true
      t.string :text
      t.references :album, index: true

      t.timestamps
    end
  end
end
