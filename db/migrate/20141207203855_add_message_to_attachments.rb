class AddMessageToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :message, :string
  end
end
