class AttachmentComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :attachment
end
