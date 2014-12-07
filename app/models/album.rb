class Album < ActiveRecord::Base
  belongs_to :trip
  belongs_to :created_by, class_name: "User"
end
