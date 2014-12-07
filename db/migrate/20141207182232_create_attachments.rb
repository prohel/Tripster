class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :names
      t.string :type
      t.references :trip, index: true
      t.references :album, index: true, :null => true
      t.references :created_by, index: true
      t.string :url

      t.timestamps
    end
  end
end
