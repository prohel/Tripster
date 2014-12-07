class CreateAttachmentRatings < ActiveRecord::Migration
  def change
    create_table :attachment_ratings do |t|
      t.references :user, index: true
      t.integer :score
      t.references :attachment, index: true

      t.timestamps
    end
  end
end
