class Trip < ActiveRecord::Base
	validates_date :start_date, :before => lambda{|m| m.end_date} 
	validates_date :end_date, :after => lambda{|m| m.start_date}
	#validates_date :end_time, :before => lambda{|m| m.date_end}
	#{on_or_before: lambda{Date.curremt}, type: :date}
end
