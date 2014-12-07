class CreateAttachmentComments < ActiveRecord::Migration
  def change
    create_table :attachment_comments do |t|
      t.references :user, index: true
      t.string :text
      t.references :attachment, index: true

      t.timestamps
    end
  end
end
